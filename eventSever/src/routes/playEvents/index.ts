import express from 'express';
import * as eventController from './playEvents.controller';

const router = express.Router();

router.post('/', eventController.create);
router.get('/', eventController.list);

export default router;
