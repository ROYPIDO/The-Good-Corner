import {
    BaseEntity,
    Column,
    Entity,
    ManyToMany,
    PrimaryGeneratedColumn,
  } from "typeorm";
  import Ad from "./Ad";
  
  @Entity()
  class Tag extends BaseEntity {
    @PrimaryGeneratedColumn()
    id: number;
  
    @Column()
    title: string;
  
    @ManyToMany(() => Ad, (ad) => ad.tags)
    ads: Ad[];
  }
  
  export default Tag;