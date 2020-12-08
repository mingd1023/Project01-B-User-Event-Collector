import styled from 'styled-components';
import LibraryHeader from '@components/organisms/Library/LibraryHeader/LibraryHeader';
import LibraryCardList from '@components/organisms/Library/LibraryCardList/LibraryCardList';
import apiUrl from 'constants/apiUrl';
import { request } from '@utils/apis';

const LibraryContainer = styled.div`
    width: 100%;
    min-height: 1300px;
    display: flex;
    flex-flow: column;
    align-items: center;
    background-color: white;
    padding: 0 0 300px 225px;
`;

const LibraryHeaderContainer = styled.div`
    margin: 50px 0 30px 0;
`;

const LibraryContentsContainer = styled.div``;

const AlbumLibrary = ({ albumData }) => {
    return (
        <LibraryContainer>
            <LibraryHeaderContainer>
                <LibraryHeader sort="album" />
            </LibraryHeaderContainer>
            <LibraryContentsContainer>
                <LibraryCardList variant="album" items={albumData} />
            </LibraryContentsContainer>
        </LibraryContainer>
    );
};

export const getServerSideProps = async () => {
    const albumData = await request(apiUrl.libraryAlbum);
    return {
        props: {
            albumData,
        },
    };
};
export default AlbumLibrary;
