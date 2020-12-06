import styled from 'styled-components';
import { useState } from 'react';

import CheckBox from '@components/atoms/CheckBox';
import CloseIcon from '@material-ui/icons/Close';
import IconButton from '@components/atoms/IconButton';
import Button from '@components/atoms/Button';
import PlayArrowIcon from '@material-ui/icons/PlayArrow';
import PlaylistPlayIcon from '@material-ui/icons/PlaylistPlay';
import QueueMusicIcon from '@material-ui/icons/QueueMusic';
import MusicNoteIcon from '@material-ui/icons/MusicNote';

const Container = styled.div`
    position: fixed;
    top: 0;
    right: 0;
    left: 225px;
    z-index: 2000;
    border-bottom: 1px solid #e4e4e4;
    background-color: #f2f2f2;
    box-shadow: 0 2px 4px 0 rgba(0,0,0,.07);
    height: 150px;
    display: flex;
    flex-flow: column;
    align-items: center;
    visibility: hidden;
`;

const SelectAreaContainer = styled.div`
    width: 960px;
    height: 75px;
    display: flex;
    align-items: center;
    border-bottom: 1px solid #e4e4e4;
`;

const CheckBoxContainer = styled.div`
    display: flex;
    align-items: center;
    height: 75px;
    width: 40px;
    padding: 0 0 19px 0px;
`;

const CheckBoxSpan = styled.span`
    display: flex;
    align-items: center;
    height: 75px;
    margin-right: 10px;
    width: 70px;
`;

const SelectedTrackCounter = styled.div`
    display: flex;
    align-items: center;
    color: #FF1150;
    font-weight: 600;
    height: 75px;
    width: 800px;
`;

const CloseButtonContainer = styled.div`
    display: flex;
    align-items: center;
    height: 75px;
`;

const ButttonAreaContainer = styled.div`
    width: 960px;
    height: 75px;
    display: flex;
    align-items: center;
`;

const PlayButtonContainer = styled.div`
    margin-left: 450px;
`;

const FloatingSelectMenu = () => {
    const [selectedTrackCount, setSelectedTrackCount] = useState(0);
    return (
        <Container>
            <SelectAreaContainer>
                <CheckBoxContainer><CheckBox id= "floatingMenu"/></CheckBoxContainer>
                <CheckBoxSpan>
                    전체선택
                </CheckBoxSpan>
                <SelectedTrackCounter>
                    {selectedTrackCount}곡 선택
                </SelectedTrackCounter>
                <CloseButtonContainer>
                    <IconButton variant="plainBlackRegular" icon={CloseIcon} />
                </CloseButtonContainer>
            </SelectAreaContainer>
            <ButttonAreaContainer>
                <Button variant="secondary" height="40" icon={PlaylistPlayIcon}>현재재생목록에 추가</Button>
                <Button variant="secondary" height="40" icon={QueueMusicIcon}>추가</Button>
                <Button variant="secondary" height="40" icon={MusicNoteIcon}>MP3 구매</Button>
                <PlayButtonContainer>
                    <Button variant="primary" width="120" height="40" icon={PlayArrowIcon}>재생</Button>
                </PlayButtonContainer>
            </ButttonAreaContainer>
        </Container>
    )
}

export default FloatingSelectMenu;