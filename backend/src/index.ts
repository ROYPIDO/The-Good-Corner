import { Metadata } from "./../node_modules/libphonenumber-js/custom.d";
import express from "express";
import sqlite3 from "sqlite3";
import "reflect-metadata";
import { dataSource } from "./config/db";
import Ad from "./entities/Ad";
import Category from "./entities/Category";

//const db = new sqlite3.Database("good_corner.sqlite");

const port = 3000;
const app = express();

app.use(express.json());

app.get("/ad", async (_req, res) => {
  try {
    const allAds = await Ad.find();
    res.status(200).json(allAds); // Send the data if it's successfully fetched
  } catch (error) {
    res
      .status(500)
      .send({ message: "Erreur lors de la récupération des annonces" });
  }
});

app.post("/ad", async (req, res) => {
  const ad = new Ad();
  ad.title = req.body.title;
  ad.description = req.body.description;
  ad.owner = req.body.owner;
  ad.price = req.body.price;
  ad.createdAt = req.body.createdAt;
  ad.picture = req.body.picture;
  ad.location = req.body.location;

  try {
    await ad.save();
    res.status(201).send("Ad has been created");
  } catch (error) {
    res.status(500).send({ message: "Error creating ad" });
  }
});

app.put("/ad/:id", async (req, res) => {
  const id = parseInt(req.params.id);
  try {
    const adFromDB = await Ad.findOneByOrFail({ id });
    adFromDB.title = req.body.title;
    adFromDB.description = req.body.description;
    adFromDB.owner = req.body.owner;
    adFromDB.price = req.body.price;
    adFromDB.createdAt = req.body.createdAt;
    adFromDB.picture = req.body.picture;
    adFromDB.location = req.body.location;
    await adFromDB.save();
    res.send(adFromDB);
  } catch (error) {
    res.status(500).send({ message: "Error updating ad" });
  }
});

app.delete("/ad/:id", async (req, res) => {
  const id = parseInt(req.params.id);
  try {
    await Ad.delete({ id });
    res.send("OK");
  } catch (error) {
    res.status(500).send({ message: "Error deleting ad" });
  }
});



app.listen(port, async () => {
  console.log(`Example app listening on port ${port}`);
  await dataSource.initialize();
  const categories = await Category.find();
  if (categories.length===0){
    const misc  = new Category();
    misc.name = "misc";
    misc.save();
  }
});
