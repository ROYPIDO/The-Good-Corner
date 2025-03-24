import {
  BaseEntity,
  Column,
  Entity,
  JoinTable,
  ManyToMany,
  ManyToOne,
  PrimaryGeneratedColumn,
} from "typeorm";
import Category from "./Category";
import Tag from "./Tag";

@Entity()
class Ad extends BaseEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  title: string;

  @Column()
  description: string;

  @Column()
  owner: string;

  @Column()
  price: number;

  @Column()
  createdAt: Date;

  @Column()
  picture: string;

  @Column()
  location: string;

  @ManyToOne(() => Category, (category) => category.ads, {
    nullable: false,
    eager: true,
  })
  category: Category;

  @ManyToMany(()=> Tag, (tag) =>tag.ads, {nullable : false, eager: true})
  @JoinTable()
  tags : Tag[]
}

export default Ad;