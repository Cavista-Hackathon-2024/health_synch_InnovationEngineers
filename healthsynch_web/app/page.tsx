import Feature1 from "@/public/icons_images/Feature1";
import { Button } from "./components/ui/button";
import Link from "next/link"
import CardComponent from "./components/ui/card";

import * as React from "react"
import { Profile } from "@/public/icons_images/profile";

import { CarouselPlugin } from "./components/ui/Carousel";

export default function Home() {

  return (
    <main className="flex  flex-col items-center justify-between p-24">
      <div>
        <section id="home" className="text-center max-w-[600px]  mx-auto mb-12">
          <h1 className="font-bold text-4xl py-4" style={{ color: '#528be7' }}>Revolutionize HealthSync Data Management</h1>
          <p className="text-xl mb-3">Welcome to HealthSync, your all-in-one platform for personalized healthcare. A powerful platform for decentralized healthcare data sharing and management.</p>
          <Button asChild>
            <Link href="/" className="btn" style={{ backgroundColor: 'black' }}>Get Started</Link></Button>
        </section>

        {/* <div className="my-10">
          <CarouselPlugin />
        </div> */}

        <section id="features" className="features" style={{ backgroundColor: '#528be7', padding: '20px', marginTop: '15px' }}>
          <h2 className="text-center font-bold text-2xl pb-8 mx-auto" style={{ color: 'white' }}>Key Features</h2>
          <div className="feature flex flex-wrap gap-4 text-center items-center mx-auto" style={{ justifyContent: 'space-evenly', alignItems: 'stretch' }}>
            <CardComponent heading="Decentralized Data Sharing" description="Easily manage and securely share your medical records with trusted healthcare providers and family members. Our decentralized data sharing ensures privacy and confidentiality, allowing for seamless collaboration in your healthcare journey." Image={<Feature1 />} />
            <CardComponent heading="Personalized Healthcare Insights" description="Receive personalized recommendations tailored to your health history, lifestyle, and real-time biometric data from digital wristwatches. Gain valuable insights into your health status and receive actionable advice for optimizing your wellness." Image={<Feature1 />} />
            <CardComponent heading="Disease Progression & Treatment Monitoring" description="Track disease progression, monitor treatment effectiveness, and stay informed with real-time health updates. Our platform integrates data from digital wristwatches, providing you with comprehensive insights into your health metrics and trends." Image={<Feature1 />} />
            <CardComponent heading="Digital Assistance:" description="Access instant support and guidance through our interactive chatbot. Whether you have questions about your health or need assistance scheduling appointments, our virtual assistant is here to help, 24/7." Image={<Feature1 />} />
          </div>
        </section>

        <section id="about" className="about  my-8">
          <h2 className="text-center font-bold text-2xl py-4">About Us</h2>
          <p className="text-center">Meet the team behind the Healthcare Data App, dedicated to improving healthcare delivery.</p>
          <div className="flex flex-wrap gap-4 m-8">
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
