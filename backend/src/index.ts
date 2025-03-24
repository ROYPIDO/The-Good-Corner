import express from "express";
import dataSource from "./config/db";
import Ad from "./entities/Ad";
import Category from "./entities/Category";

const port = 3000;
const app = express();
app.use(express.json());

const startServer = async () => {
  try {
    await dataSource.initialize();
    console.log("✅ Database initialized");

    app.post("/ads", async (req, res) => {
      //const ad = new Ad();
      const ad = Ad.create(req.body)
      ad.title = req.body.title;
      ad.description = req.body.description;
      ad.owner = req.body.owner;
      ad.price = req.body.price;
      ad.createdAt = req.body.createdAt;
      ad.picture = req.body.picture;
      ad.location = req.body.location;
      ad.category = req.body.category;
      try {
        await ad.save();
        res.status(201).send("ad has been created");
      } catch (err) {
        console.log(err);
        res.status(500).send(err);
      }
    });

    app.get("/ads", async (_req, res) => {
      const allAds = await Ad.find({ relations: ["category"] });
      res.json(allAds);
    });

    app.delete("/ads/:id", async (req, res) => {
      try {
        await Ad.delete({ id: Number.parseInt(req.params.id) });
        res.send("Ad has been removed");
      } catch (err) {
        console.log("err", err);
        res.status(500).send(err);
      }
    });

    app.put("/ads/:id", async (req, res) => {
      await Ad.update({ id: Number.parseInt(req.params.id) }, req.body);
      res.send("Ad has been updated");
    });

    app.post("/categories", async (req, res) => {
      const category = Category.create({ title: req.body.title });
      await category.save();
      res.status(201).json(category);
    });

    app.get("/categories", async (_req, res) => {
      const categories = await Category.find();
      res.json(categories);
    });

   
    app.listen(port, async () => {
      console.log(`🚀 Server running on port ${port}`);

      const categories = await Category.find();
      if (categories.length === 0) {
        const misc = Category.create({ title: "misc" });
        await misc.save();
        console.log("✅ 'misc' category created");
      }
    });
  } catch (error) {
    console.error("❌ Database connection error:", error);
  }
};

// Burada çalıştır
startServer();
