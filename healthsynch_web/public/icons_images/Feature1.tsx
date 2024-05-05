import Image from 'next/image'
import feature from '@/public/Feature1.png'
 
export default function Feature1() {
  return (
    <Image
      src={feature}
      width={60}
      height={60}
      alt="Picture of the author"
    />
  )
}