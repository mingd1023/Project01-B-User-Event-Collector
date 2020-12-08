const baseUrl = 'http://localhost:4500/api';

const apiUrl = {
    magazine: `${baseUrl}/magazines`,
    news: `${baseUrl}/news`,
    playlist: `${baseUrl}/playlists`,
    mixtape: `${baseUrl}/library/mixtapes`,
    album: `${baseUrl}/albums`,
    libraryAlbum: `${baseUrl}/library/albums`,
    libraryTrack: `${baseUrl}/library/tracks`,
    libraryArtist: `${baseUrl}/library/artists`,
    libraryPlaylist: `${baseUrl}/library/playlists`,
    libraryMixtape: `${baseUrl}/library/mixtapes`
};

export default apiUrl;
