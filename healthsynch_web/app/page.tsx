import Feature1 from "@/public/icons_images/Feature1";
import { Button } from "./components/ui/button";
import Link from "next/link"
import CardComponent from "./components/ui/card";

import * as React from "react"
import { Profile } from "@/public/icons_images/profile";

import { CarouselPlugin } from "./components/ui/Carousel";

export default function Home() {

  return (
    <main className="flex min-h-screen flex-col items-center justify-between p-24">
      <div>
        <section id="home" className="text-center max-w-xl mx-auto mb-12">
          <h1 className="font-bold text-4xl py-4" style={{ color: '#528be7' }}>Revolutionize HealthSync Data Management</h1>
          <p className="text-xl mb-3">A powerful platform for decentralized healthcare data sharing and management.</p>
          <Button asChild>
            <Link href="#signup" className="btn" style={{ backgroundColor: 'black' }}>Get Started</Link></Button>
        </section>

        <div className="my-10">
          <CarouselPlugin />
        </div>

        <section id="features" className="features p-12 m-12" style={{ backgroundColor: '#528be7' }}>
          <h2 className="text-center font-bold text-2xl pb-8 mx-auto" style={{ color: 'white' }}>Key Features</h2>
          <div className="hero feature flex flex-wrap gap-4 text-center items-center mx-auto" style={{ justifyContent: 'space-evenly' }}>
            <CardComponent heading="Decentralized Data Sharing" description="Efficiently share medical data among healthcare providers and patients." Image={<Feature1 />} />
            <CardComponent heading="Decentralized Data Sharing" description="Efficiently share medical data among healthcare providers and patients." Image={<Feature1 />} />
            <CardComponent heading="Decentralized Data Sharing" description="Efficiently share medical data among healthcare providers and patients." Image={<Feature1 />} />
            <CardComponent heading="Decentralized Data Sharing" description="Efficiently share medical data among healthcare providers and patients." Image={<Feature1 />} />
          </div>
        </section>

        <section id="about" className="about mx-12 my-8">
          <h2 className="text-center font-bold text-2xl py-4">About Us</h2>
          <p className="text-center">Meet the team behind the Healthcare Data App, dedicated to improving healthcare delivery.</p>
          {/* Include team information here */}
          <div className="flex flex-row gap-4 m-8">
            {Profile.map((profile) => (
              <div key={`${profile.name}`} className="justify-center items-center text-center mx-auto">
                <div className="w-[120px] h-[120px] rounded-lg overflow-hidden">
                  <span>{profile.image}</span>
                </div>
                <h1 className="text-[12px] font-bold pt-2">{profile.name}</h1>
                <p className="text-[8px]">{profile.role}</p>
              </div>
            ))}

          </div>
        </section>

        {/* <section id="contact" className="contact m-5">
          <h2>Contact Us</h2>
          <div className="social">
            <a href="#">Facebook</a>
            <a href="#">Twitter</a>
            <a href="#">LinkedIn</a>
          </div>
        </section> */}
      </div>

      <footer className="text-center mx-12">
        {/* <nav className="mt-12">
          <ul>
            <li><a href="#">Privacy Policy</a></li>
            <li><a href="#">Terms of Service</a></li>
          </ul>
        </nav> */}
        <p className="mt-2">&copy; 2024 HealthSync Data App. All rights reserved.</p>
      </footer>
    </main>
  );
}
