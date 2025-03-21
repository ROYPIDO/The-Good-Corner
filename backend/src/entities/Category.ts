import { 
    BaseEntity, 
    Column, 
    Entity, 
    PrimaryGeneratedColumn, 
    OneToMany 
  } from "typeorm";
  import Ad from "./Ad";
  
  @Entity()
  class Category extends BaseEntity {
    @PrimaryGeneratedColumn()
    id: number;
  
    @Column({ length: 100 })
    name: string; 
  
    @OneToMany(() => Ad, (ad) => ad.category)
    ads: Ad[];
  }
  
  export default Category;
  