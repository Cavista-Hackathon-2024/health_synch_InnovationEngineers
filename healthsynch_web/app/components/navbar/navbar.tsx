"use client";

import React, { useState } from 'react';
import Logo from "@/public/icons_images/logo";
import { Button } from "../ui/button";
import Link from "next/link";
import { Menu, X } from 'lucide-react';

export default function Navbar() {
  const [isOpen, setIsOpen] = useState(false);

  const toggleMenu = () => {
    setIsOpen(!isOpen);
  };

  return (
    <nav className="bg-white border flex h-16">
      <div className="flex justify-between gap-10 w-full items-center pr-[2.12rem] flex-row p-5">
        <Link href="/" className="flex flex-row">
          <Logo />
          <p className="text-2xl font-bold pl-3" style={{ color: '#528be7' }}>
            Health Synch
          </p>
        </Link>

        <div className="block md:hidden">
          <button
            className="flex items-center px-3 py-2 border rounded"
            style={{ color: '#528be7' }}
            onClick={toggleMenu}
          >
            {isOpen ? <X /> : <Menu />}

          </button>
        </div>

        <div className={`block flex-grow justify-end md:flex md:items-center md:w-auto ${isOpen ? 'block top-12 bg-white absolute w-[90vw] py-5' : 'hidden'}`}>
          <div>
            <ul className={`flex  font-bold text-center md:flex-row sm:flex-col ${isOpen ? 'flex-col' : ''}`}>
              <li className="p-4" style={{ color: '#528be7' }}><a href="#home">Home</a></li>
              <li className="p-4" style={{ color: '#528be7' }}><a href="#about">About Us</a></li>
              <li className="p-4" style={{ color: '#528be7' }}><a href="#features">Features</a></li>
              {/* <li className="p-4" style={{ color: '#528be7' }}><a href="#contact">Contact</a></li> */}
            </ul>
         
          </div>
          <div className='items-center text-center'>
            <Button asChild>
              <Link href="/" style={{ backgroundColor: '#528be7' }}>Get Mobile app</Link>
            </Button>
          </div>
        </div>
      </div><h1></h1>