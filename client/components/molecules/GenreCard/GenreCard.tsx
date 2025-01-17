import React from 'react';
import styled from 'styled-components';
import Text from '../../atoms/Text';
import { getRandomColor } from '@utils/color';

const Card = styled.div`
    display: flex;
    align-items: center;
    height: 60px;
    padding: 0 9px;
    color: #232323;
    text-align: left;
    border-radius: 4px;
    background-color: #ececec;
    margin-bottom: 12px;
`;

const Bar = styled.div`
    width: 4px;
    height: 42px;
    border-radius: 3px;
    background-color: ${(props) => props.color};
`;

const Content = styled.div`
    padding: 0 15px;
`;

interface GenreCardProps {
    id: number;
    name: string;
    href?: string;
    color?: string;
}

const GenreCard = ({ id, name, href, color }: GenreCardProps) => (
    <Card>
        {/* TODO : Link 컴포넌트로 감싸기 */}
        {/* <Link href={href}/> */}
        <Bar color={color ? color : getRandomColor()} />
        <Content>
            <Text>{name}</Text>
        </Content>
    </Card>
);

export default GenreCard;
