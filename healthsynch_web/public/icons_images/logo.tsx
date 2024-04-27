import Image from 'next/image'
import logo from '@/public/logo.png'
 
export default function Logo() {
  return (
    <Image
      src={logo}
      width={40}
      height={40}
      alt="Picture of the author"
    />
  )
}