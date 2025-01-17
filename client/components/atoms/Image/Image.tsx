import React from 'react';
import { func, node, string } from 'prop-types';

import StyledImage from './Image.styles';

const Image = ({
  variant, src
}) => <StyledImage alt = "image" variant={variant} src={src} />;

// Expected prop values
Image.propTypes = {
  variant: string,
  src: string
};

// Default prop values
Image.defaultProps = {
  children: 'Image',
};

export default Image;
