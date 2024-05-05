import Image from 'next/image';
import Image1 from '@/public/Image1.jpg';
import Image2 from '@/public/Image2.jpg';
import Image3 from '@/public/Image3.jpg';
import Image4 from '@/public/Image4.jpg';
import Image5 from '@/public/Image5.jpg';
import { ReactNode } from 'react';

const Images: ReactNode[] = [
  <Image src={Image1} style={{ width: '300px', height: '200px', objectFit: 'cover' }} alt="Carousel Images" />,
  <Image src={Image2} style={{ width: '300px', height: '200px', objectFit: 'cover' }} alt="Carousel Images" />,
  <Image src={Image3} style={{ width: '300px', height: '200px', objectFit: 'cover' }} alt="Carousel Images" />,
  <Image src={Image4} style={{ width: '300px', height: '200px', objectFit: 'cover' }} alt="Carousel Images" />,
  <Image src={Image5} style={{ width: '300px', height: '200px', objectFit: 'cover' }} alt="Carousel Images" />
];

export { Images };