import express from 'express';
import * as playlistsController from './library.playlists.controller';

const router = express.Router();

router.get('/', playlistsController.list);
router.post('/', playlistsController.create);
export default router;
