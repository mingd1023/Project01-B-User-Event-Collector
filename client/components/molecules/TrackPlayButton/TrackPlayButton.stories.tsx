import React from 'react';
import TrackPlayButton from './index';

export default {
    title: 'Molecules/TrackPlayButton',
    component: TrackPlayButton,
};
const STORY_SRC = 'https://musicmeta-phinf.pstatic.net/artist/002/826/2826154.jpg?type=ff300_300&v=20191231151906';

export const TrackRowCard = () => <TrackPlayButton src={STORY_SRC} imgVariant="trackRowCard" />;
export const TrackInfo = () => <TrackPlayButton src={STORY_SRC} imgVariant="trackInfo" />;