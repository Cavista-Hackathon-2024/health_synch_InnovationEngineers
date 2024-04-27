import Feature1 from "@/public/icons/Feature1";
import { Button } from "./components/ui/button";
import Link from "next/link"
import CardComponent from "./components/ui/card";

import * as React from "react"

import { Card, CardContent } from "@/components/ui/card"
import {
  Carousel,
  CarouselContent,
  CarouselItem,
  CarouselNext,
  CarouselPrevious,
} from "@/components/ui/carousel"
import { CarouselPlugin } from "./components/ui/Carousel";

// import Image from "next/image";

export default function Home() {
  return (
    <main className="flex min-h-screen flex-col items-center justify-between p-24">
      <div>
        <section id="home" className="hero text-center max-w-xl mx-auto mb-12">
          <h1 className="font-bold text-4xl py-4" style={{ color: '#528be7' }}>Revolutionize Healthcare Data Management</h1>
          <p className="text-xl mb-3">A powerful platform for decentralized healthcare data sharing and management.</p>
          <Button asChild>
            <Link href="#signup" className="btn" style={{ backgroundColor: 'black' }}>Get Started</Link></Button>
        </section>

        <div className="my-10">
          <CarouselPlugin />
        </div>

        <section id="features" className="features p-12 m-12" style={{ backgroundColor: '#528be7' }}>
          <h2 className="text-center font-bold text-2xl pb-8 mx-auto" style={{ color: 'white' }}>Key Features</h2>
          <div className="hero feature flex flex-wrap gap-4 text-center items-center mx-auto mx-auto space-y-4" style={{ justifyContent: 'space-evenly' }}>
            <CardComponent heading="Decentralized Data Sharing" description="Efficiently share medical data among healthcare providers and patients." Image={<Feature1 />} />
            <CardComponent heading="Decentralized Data Sharing" description="Efficiently share medical data among healthcare providers and patients." Image={<Feature1 />} />
            <CardComponent heading="Decentralized Data Sharing" description="Efficiently share medical data among healthcare providers and patients." Image={<Feature1 />} />
            <CardComponent heading="Decentralized Data Sharing" description="Efficiently share medical data among healthcare providers and patients." Image={<Feature1 />} />
          </div>

        </section>

        <section id="about" className="about mx-12">
          <h2 className="text-center font-bold text-2xl py-4">About Us</h2>
          <p className="text-center">Meet the team behind the Healthcare Data App, dedicated to improving healthcare delivery.</p>
          {/* Include team information here */}
        </section>

        {/* <section id="contact" className="contact m-5">
          <h2>Contact Us</h2>
          <form action="#" method="POST">
            <input type="text" name="name" placeholder="Your Name" required />
            <input type="email" name="email" placeholder="Your Email" required />
            <textarea name="message" placeholder="Your Message" required></textarea>
            <button type="submit">Send Message</button>
          </form>
          <div className="social">
            <a href="#">Facebook</a>
            <a href="#">Twitter</a>
            <a href="#">LinkedIn</a>
          </div>
        </section> */}
      </div>

      <footer className="text-center">
        <nav>
          <ul>
            <li><a href="#">Privacy Policy</a></li>
            <li><a href="#">Terms of Service</a></li>
          </ul>
        </nav>
        <p>&copy; 2024 Healthcare Data App. All rights reserved.</p>
      </footer>
    </main>
  );
}
