import {
    Entity, PrimaryGeneratedColumn, Column, ManyToOne,
} from 'typeorm';
import Genre from './Genre';
import Artist from './Artist';

@Entity()
class Album {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    title: string;

    @Column()
    description: string;

    @Column('date')
    release_date: Date;

    @Column()
    image_url: string;

    @ManyToOne((type) => Genre, (genre) => genre.albums)
    genre: Genre;

    @ManyToOne((type) => Artist, (artist) => artist.albums)
    artist: Artist;
}

export default Album;
