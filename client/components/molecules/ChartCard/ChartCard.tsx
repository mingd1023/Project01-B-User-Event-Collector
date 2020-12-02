import React from 'react';
import Image from '@components/atoms/Image/Image';
import Text from '@components/atoms/Text/Text';
import TrackPlayButton from '@components/molecules/TrackPlayButton/TrackPlayButton';
import { Card, Rank, SongInfo } from './ChartCard.styles';

const ChartCard = ({ src, rank, artist, trackTitle }) => (
    <Card>
        <TrackPlayButton src={src} />
        <Rank>
            <Text variant="k">{rank.toString()}</Text>
        </Rank>
        <SongInfo>
            <a href="#">
                <Text variant="">{trackTitle}</Text>
            </a>
            <a href="#">
                <Text variant="primary">{artist}</Text>
            </a>
        </SongInfo>
    </Card>
);

export default ChartCard;
