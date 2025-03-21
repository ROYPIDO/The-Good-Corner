import { 
    BaseEntity, 
    Column, 
    Entity, 
    PrimaryGeneratedColumn, 
    ManyToMany 
  } from "typeorm";
  import Ad from "./Ad";
  
  @Entity()
  class Tag extends BaseEntity {
    @PrimaryGeneratedColumn()
    id: number;
  
    @Column()
    new: boolean;
  
    @Column()
    ocassion: boolean;
  

    @ManyToMany(() => Ad, (ad) => ad.tags)
    ads: Ad[];
  }
  
  export default Tag;
  