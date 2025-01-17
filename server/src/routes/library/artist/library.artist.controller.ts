import { Request, Response, NextFunction } from 'express';
import { getManager, getRepository } from 'typeorm';
import User from '../../../models/User';
import Artist from '../../../models/Artist';

const create = async (req: Request, res: Response, next: NextFunction) => {
    const { id } = req.body;
    const userId = req.user;

    const manager = getManager();

    const user = await manager.findOne(User, userId, { relations: ['libraryArtists'] });
    const artist = await manager.findOne(Artist, id);

    if (!user || !artist) return res.status(404).json({ success: false });

    user.libraryArtists.push(artist);

    await manager.save(user);

    return res.json({
        success: true,
    });
};

const list = async (req: Request, res: Response, next: NextFunction) => {
    const userId = req.user;

    const userRepository = getRepository(User);
    const user = await userRepository.createQueryBuilder('user')
        .leftJoinAndSelect('user.libraryArtists', 'library_artists')
        .select([
            'user.id',
            'library_artists.id',
            'library_artists.name',
            'library_artists.imageUrl',
        ])
        .where('user.id = :id', { id: userId })
        .getOne();

    const libraryArtists = user?.libraryArtists ? user?.libraryArtists : [];

    return res.json({
        success: true,
        data: libraryArtists,
    });
};

const remove = async (req: Request, res: Response, next: NextFunction) => {
    const artistId: string = req.params.artistId as string;
    const userId = req.user;

    const manager = getManager();

    const user = await manager.findOne(User, userId, { relations: ['libraryArtists'] });

    if (!user) return res.status(401).json({ success: false });

    user.libraryArtists = user.libraryArtists
        .filter((libraryArtist) => libraryArtist.id !== +artistId);

    await manager.save(user);

    return res.json({
        success: true,
    });
};

export { create, list, remove };
