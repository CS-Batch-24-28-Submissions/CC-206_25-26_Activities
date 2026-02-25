// [IMPORT] Components
import { useState } from "react";
import { useNavigate } from "react-router-dom";
import PrimaryButton from "./components/buttons/PrimaryButton";
import SecondaryButton from "./components/buttons/SecondaryButton";
import SocialButton from "./components/buttons/SocialButton";
import ShowcaseSection from "./components/ShowcaseSection";

const Home = () => {
  const navigate = useNavigate();
  const [loaded, setLoaded] = useState(false);

  return (
    <>
      {/* Hero Section */}
      <section className="max-w-7xl mx-auto px-6 py-6 sm:px-12 sm:py-20 lg:px-12 lg:py-18 xl:pl-20 xl:pr-0 xl:py-24">
        <div className="flex flex-col items-center lg:grid lg:grid-cols-2 lg:gap-16 lg:items-start">

          {/* Text Content */}
          <div className="space-y-8 md:space-y-4 text-center lg:text-left order-2 lg:order-1 mt-8 lg:mt-0 px-2 sm:px-12 md:px-0">
            {/* Big Screens - Hero Header & Section in Left */}
            <div className="w-full hidden md:block">
              <p className="font-heading font-bold text-xl text-[var(--text-primary)]/80 md:text-md">
                Hi, I'm
              </p>
              <p className="font-heading font-bold text-5xl md:text-7xl text-[var(--text-primary)]">
                ADRIAN
              </p>
            </div>

            <div className="mb-12">
                <h3 className="text-[var(--text-primary)] md:text-[var(--text-primary)]">
                Full-stack Web Developer & Technopreneur
                </h3>
            </div>

            <p className="text-md sm:text-lg tracking-wide sm:body- text-[var(--text-secondary)]/90 max-w-xl mx-auto lg:mx-0 mb-14">
              I’m a full-stack web developer and technopreneur passionate about building software solutions for real-world problems.
              I love creating impactful projects and growing my skills through hands-on development.
            </p>

            {/* Buttons */}
            <div className="flex flex-col gap-4 items-center lg:items-center">
                <PrimaryButton
                    label="VIEW MY WORK"
                    onClick={() => navigate("/projects")}
                />
                <SecondaryButton text="Contact Me" iconSrc="/contact-icon.svg" />
                <a
                href="resume_web_development.pdf"
                download
                className="inline-block text-[var(--text-secondary)] font-medium text-sm
                relative after:content-[''] after:absolute after:bottom-0 after:h-[1px]
                after:bg-[var(--text-primary)] after:left-0
                after:w-0 hover:after:w-full after:transition-all after:duration-300"
                >
                Download CV →
                </a>
            </div>
          </div>

          {/* Hero Image */}
          <div className="relative w-full max-w-md order-1 lg:order-2 flex justify-center lg:justify-end">
              <div className="relative aspect-square md:aspect-[3/4] md:h-full shadow-[0_4px_12px_rgba(0,0,0,0.2)] w-full max-w-md">
                  {!loaded && (
                  <div className="absolute inset-0 animate-pulse bg-[var(--color-accent)]" />
                  )}

                  <img
                  src="/hero-section-profile.png"
                  alt="Project preview"
                  onLoad={() => setLoaded(true)}
                  className={`w-full h-full object-cover transition-opacity duration-300 ${
                      loaded ? "opacity-100" : "opacity-0"
                  }`}
                  />
              </div>

              {/* Name Overlay */}
              <div className="absolute bottom-0 w-full py-4 bg-[rgba(0,0,0,0.7)] text-center md:hidden">
                  <p className="font-heading font-bold text-xl text-[var(--text-primary)]">
                  Hi, I'm
                  </p>
                  <p className="font-heading font-bold text-5xl text-[var(--text-primary)]">
                  ADRIAN
                  </p>
              </div>
          </div>
        </div>
      </section>

      {/* Social Buttons Section */}
      <section className="flex flex-col items-center mt-16 mb-20 md:mt-8 space-y-4">
        <h3 className="text-[var(--text-primary)]">Follow Me</h3>
        <div className="flex gap-x-4 mt-4">
          <SocialButton href="https://www.linkedin.com/in/dreyyan/">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" className="size-7 text-[var(--icon-color)]" fill="currentColor">
              <path d="M21,21H17V14.25C17,13.19 15.81,12.31 14.75,12.31C13.69,12.31 13,13.19 13,14.25V21H9V9H13V11C13.66,9.93 15.36,9.24 16.5,9.24C19,9.24 21,11.28 21,13.75V21M7,21H3V9H7V21M5,3A2,2 0 0,1 7,5A2,2 0 0,1 5,7A2,2 0 0,1 3,5A2,2 0 0,1 5,3Z"/>
            </svg>
          </SocialButton>
          <SocialButton href="https://github.com/dreyyan">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" className="size-7 text-[var(--icon-color)]" fill="currentColor">
              <path d="M12,2C6.48,2 2,6.48 2,12C2,16.42 5.07,20.17 9.26,21.5C9.76,21.58 9.97,21.27 9.97,21.01C9.97,20.78 9.96,20.17 9.96,19.4C7,19.91 6.22,18.49 6.22,18.49C5.68,17.42 5,17.12 5,17.12C4,16.54 5.08,16.55 5.08,16.55C6.18,16.63 6.76,17.71 6.76,17.71C7.74,19.34 9.34,18.91 10,18.66C10.08,17.94 10.36,17.47 10.67,17.21C7.9,16.94 5.03,15.94 5.03,11.36C5.03,10.07 5.5,9.02 6.28,8.22C6.17,7.94 5.76,6.72 6.36,5.05C6.36,5.05 7.28,4.74 9.96,6.31C10.82,6.07 11.74,5.94 12.66,5.94C13.58,5.94 14.5,6.07 15.36,6.31C18.04,4.74 18.96,5.05 18.96,5.05C19.56,6.72 19.15,7.94 19.04,8.22C19.82,9.02 20.29,10.07 20.29,11.36C20.29,15.95 17.41,16.93 14.63,17.2C15.03,17.55 15.39,18.25 15.39,19.34C15.39,20.94 15.37,21.85 15.37,21.99C15.37,22.25 15.57,22.57 16.08,22.49C20.27,21.16 23.34,17.42 23.34,12C23.34,6.48 18.52,2 12,2Z"/>
            </svg>
          </SocialButton>
          <SocialButton href="mailto:adriandominic.tan@wvsu.edu.ph">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" className="size-7 text-[var(--icon-color)]" fill="currentColor">
              <path d="M20,4H4C2.89,4 2,4.89 2,6V18C2,19.11 2.89,20 4,20H20C21.11,20 22,19.11 22,18V6C22,4.89 21.11,4 20,4M20,8L12,13L4,8V6L12,11L20,6V8Z"/>
            </svg>
          </SocialButton>
        </div>
      </section>

      {/* Showcase Section */}
      {/* <section className="flex flex-wrap gap-6 mt-16 mb-14 justify-center">
        <ShowcaseSection />
        <ShowcaseSection />
        <ShowcaseSection />
        <ShowcaseSection />
      </section> */}
    </>
  );
};

export default Home;
