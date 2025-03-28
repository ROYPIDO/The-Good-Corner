import { DataSource } from "typeorm";
import Ad  from "../entities/Ad";
import Category from "../entities/Category";
import Tag from "../entities/Tag";
import "reflect-metadata";


export const dataSource = new DataSource({
  type: "sqlite",
  database: "good_corner.sqlite",
  entities: [Ad, Category, Tag],
  synchronize: true,
  logging: ["error", "query"],
  extra: {
    busyTimeout: 5000 
  }
});


export default dataSource


