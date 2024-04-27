import Image from 'next/image'
import logo from '@/public/Feature1.png'
 
export default function Feature1() {
  return (
    <Image
      src={logo}
      width={60}
      height={60}
      alt="Picture of the author"
    />
  )
}