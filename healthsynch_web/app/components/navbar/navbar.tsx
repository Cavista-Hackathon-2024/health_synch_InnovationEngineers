import Logo from "@/public/icons/logo";
import { Button } from "../ui/button";
import Link from "next/link"

export default function Navbar() {

  return (
    <nav className="bg-white border flex h-16">
      <div className="flex justify-between w-full items-center pr-[2.12rem] flex-row p-5">
        <Link href="/" className="flex flex-row">
          <Logo />
          <p className="text-2xl font-bold pl-3" style={{ color: '#528be7' }}>
            Health Synch
          </p>
        </Link>
        <div>
          <ul className="flex flex-row font-bold">
            <li className="p-4" style={{ color: '#528be7' }}><a href="#home">Home</a></li>
            <li className="p-4" style={{ color: '#528be7' }}><a href="#about">About Us</a></li>
            <li className="p-4" style={{ color: '#528be7' }}><a href="#features">Features</a></li>
            <li className="p-4" style={{ color: '#528be7' }}><a href="#contact">Contact</a></li>
          </ul>
        </div>
        <div>
          <Button asChild>
            <Link href="/" style={{ backgroundColor: '#528be7' }}>Get Mobile app</Link>
          </Button>
        </div>
      </div>
    </nav>
  )
}