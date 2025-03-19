import express from "express";
import sqlite3 from "sqlite3";

const db = new sqlite3.Database("good_corner.sqlite");

const port = 3000;
const app = express();

app.use(express.json());

app.get("/ads", (_req, res) => {
  db.all("SELECT * FROM AD", (err, rows) => {
    if (err) {
      res.status(500).send(err);
    } else {
      res.send(rows);
    }
  });
});

app.post("/ads", (req, res) => {
  const stmt = db.prepare(
    `INSERT INTO AD (
      TITLE,
      DESCRIPTION,
      OWNER,
      PRICE,
      CREATEDAT,
      PICTURE,
      LOCATION
    ) VALUES(?,?,?,?,?,?,?)`
  );
  stmt.run(
    [
      req.body.title,
      req.body.description,
      req.body.owner,
      req.body.price,
      req.body.createdAt,
      req.body.picture,
      req.body.location,
    ],
    (err) => {
      if (err) {
        res.status(500).send(err);
      } else {
        res.status(201).send("ad has been created");
      }
    }
  );
});

app.delete("/ads/:id", (req, res) => {
  const stmt = db.prepare("DELETE FROM AD WHERE ID=?");
  stmt.run([req.params.id], (err) => {
    if (err) {
      res.status(500).send(err);
    } else {
      res.send("ad has been deleted");
    }
  });
});

app.put("/ads/:id", (req, res) => {
  console.log(req.params.id);
  console.log(req.body);
  const stmt = db.prepare(`UPDATE AD SET
    TITLE=?,
    DESCRIPTION=?,
    OWNER=?,
    PRICE=?,
    CREATEDAT=?,
    PICTURE=?,
    LOCATION=?
    WHERE ID=?
  `);
  stmt.run([
    req.body.title,
    req.body.description,
    req.body.owner,
    req.body.price,
    req.body.createdAt,
    req.body.picture,
    req.body.location,
    req.params.id,
  ]);
  res.send("ok");
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});