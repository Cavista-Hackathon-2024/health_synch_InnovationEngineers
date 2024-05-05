import Image from 'next/image';
import Image1 from '@/public/profile_victory.jpg';
import Image2 from '@/public/profile_joel.jpg'
import Image3 from '@/public/profile_david.jpg';
import Image4 from '@/public/profile_judah.jpg';

const Profile = [
    {
        id: '1',
        name: 'Victory Abiodun-Omoniyi',
        role: 'Frontend Engineer',
        image: <Image src={Image1} width={120} height={120}  alt="team profile Images" />,
    },
    {
        id: 2,
        name: 'Joel Elias',
        role: 'Mobile Developer',
        image: <Image src={Image2} width={120} height={120}  alt="team profile Images" />,
    },
    {
        id: 3,
        name: 'David Adesanya',
        role: 'IOT Engineer',
        image: <Image src={Image3} width={120} height={120}  alt="team profile Images" />,
    },
    {
        id: 4,
        name: 'Judah Aderonmu',
        role: 'Product Manager',
        image: <Image src={Image4} width={120} height={120}  alt="team profile Images" />,
    },
]

export { Profile }