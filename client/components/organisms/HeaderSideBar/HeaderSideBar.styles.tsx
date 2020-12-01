import styled from 'styled-components';

interface SearchContainerProps {
    searching: boolean;
}

const LogoContainer = styled.div`
    display: flex;
    justify-content: space-between;
    align-items: center;
    color: white;
    padding: 9px 6px;
    margin: 0px;
`;

const Logo = styled.h1`
    display: inline-flex;
    margin: 0 0 5px 0;

    & > * {
        margin: 5px;
    }
`;

const SearchContainer = styled.div<SearchContainerProps>`
    overflow: hidden;
    position: fixed;
    height: ${(props) => props.searching? '67px' : '0'};
    top: 0;
    right: 0;
    left: 225px;
    z-index: 50;
    padding: 0 30px;
    border-bottom: 1px solid rgba(0,0,0,.1);
    background-color: hsla(0,0%,100%,.98);
    transition: height .2s;
`

const SectionContainer = styled.div`
    padding: 0 15px;
`;

const ProfileContainer = styled.div`
    border: 1px solid hsla(0,0%,84.7%,.13);
    border-width: 1px 0;
    padding: 11px 0;
`
const Header = styled.header`
    position: fixed;
    top: 0;
    left: 0;
    bottom: 81px;
    width: 225px;
    background-color: black;
`;

export { LogoContainer, Logo, SearchContainer, SectionContainer, ProfileContainer, Header };