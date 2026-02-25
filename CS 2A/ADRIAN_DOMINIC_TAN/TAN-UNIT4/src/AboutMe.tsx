import { useState } from "react";

const aboutSections = [
  {
    key: "why",
    title: "WHY I CODE",
    img: "/why-i-code.jpg",
    alt: "Why I Code",
    description: `Hi, I’m Adrian — a full-stack web developer and technopreneur from the Philippines. I’ve always been fascinated by how technology can turn ideas into real solutions, and that curiosity has driven me to build software that makes life easier, more efficient, and more fun.`,
  },
  {
    key: "spec",
    title: "SPECIALIZATION",
    img: "/specialization.jpg",
    alt: "Specialization",
    description: `I specialize in React, TypeScript, and Python, creating web apps that are scalable, responsive, and user-friendly. From concept to deployment, I enjoy solving problems with clean, maintainable code and seeing my projects come to life.`,
  },
  {
    key: "values",
    title: "VALUES & MINDSET",
    img: "/values.jpg",
    alt: "Values and Mindset",
    description: `Beyond coding, I value continuous learning, creativity, and impact. I approach every project with a growth mindset, embracing challenges as opportunities to improve and deliver meaningful results. I love collaborating with others, sharing knowledge, and finding innovative ways to bridge technology and everyday needs.`,
  },
];

const Home = () => {
    const [aboutLoaded, setAboutLoaded] = useState(false);
    const [loaded, setLoaded] = useState({});

    return (
        <div className="flex-col w-auto h-auto py-16 px-10">

            {/* [IMAGE] About Me */}
            <div className="relative w-full aspect-[3/4] mb-12 max-w-80 mx-auto">
            {!aboutLoaded && (
                <div className="absolute inset-0 animate-pulse bg-[var(--accent)] rounded" />
            )}

            <img
                src="/about-me-image.jpg"
                alt="About Me - Picture"
                onLoad={() => setAboutLoaded(true)}
                className={`w-full h-full object-cover transition-opacity duration-300 ${
                aboutLoaded ? "opacity-100" : "opacity-0"
                }`}
            />
            </div>

            {/* About Me - Role & Education */}
            <div className="mb-20 px-14 space-y-4">
                <p className="font-heading font-black text-5xl sm:text-6xl md:text-7xl text-center mb-12">ABOUT ME</p>
                <p className="font-heading font-bold text-3xl sm:text-4xl md:text-5xl tracking-widest text-center">ADRIAN TAN</p>

                <div className="sm:flex justify-center gap-x-2 [&>p]:font-heading [&>p]:font-bold [&>p]:text-lg [&>p]:sm:text-xl [&>p]:md:text-2xl [&>p]:text-center">
                <p>WEB DEVELOPER</p>
                <p className="hidden sm:block">◦</p>
                <p>TECHNOPRENEUR</p>
                </div>

                <div className="space-y-1">
                    <p className="font-heading font-bold text-sm sm:text-md md:text-lg text-center">BS COMPUTER SCIENCE</p>
                    <p className="font-heading italic text-sm sm:text-md md:text-lg text-center">WEST VISAYAS STATE UNIVERSITY (2028)</p>
                </div>
            </div>

            {/* About Me - Description */}
            <div className="md:px-20 lg:px-32 xl:px-60 2xl:px-120">
            {aboutSections.map((section) => (
                <div key={section.key} className="mb-19 space-y-6 md:grid md:grid-cols-2 md:gap-x-8 lg:gap-x-12">
                {/* Aspect Ratio Container */}
                <div className="relative w-full h-full aspect-[4/3] rounded overflow-hidden">
                    {!loaded[section.key] && (
                    <div className="absolute inset-0 animate-pulse bg-[var(--color-accent)]" />
                    )}

                    <img
                    src={section.img}
                    alt={section.alt}
                    onLoad={() =>
                        setLoaded((prev) => ({ ...prev, [section.key]: true }))
                    }
                    className={`absolute inset-0 w-full h-full object-cover transition-opacity duration-300 ${
                        loaded[section.key] ? "opacity-100" : "opacity-0"
                    }`}
                    />
                </div>

                    <div className="space-y-6">
                        <header className="font-heading font-bold text-3xl md:text-4xl lg:text-5xl">
                            {section.title}
                        </header>

                        <p className="md:text-md lg:text-lg">{section.description}</p>
                    </div>
                </div>
            ))}
            </div>
        </div>
	);
};
export default Home;