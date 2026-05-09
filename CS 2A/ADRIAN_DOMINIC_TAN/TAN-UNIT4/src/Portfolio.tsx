import { useState } from "react";
import ProjectCard from "./components/ProjectCard";
import OtherProjectCard from "./components/OtherProjectCard";
import { otherProjectsData } from "./data/projectsData";

const Portfolio = () => {
  const [otherProjects, setOtherProjects] = useState(false);
  const [selectedCategory, setSelectedCategory] = useState("All");

  // Get unique categories for the dropdown
  const categories = ["All", ...Array.from(new Set(otherProjectsData.map(p => p.category)))];

  // Filtered projects based on selected category
  const filteredProjects =
    selectedCategory === "All"
      ? otherProjectsData
      : otherProjectsData.filter(p => p.category === selectedCategory);

  return (
    <div className="flex-col w-auto h-auto py-16 px-10">
      {!otherProjects ? (
        <>
          <p className="font-heading font-black text-5xl text-center mb-12">
            PORTFOLIO
          </p>

          {/* Projects Grid */}
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-8 mb-8 justify-items-center">
            <ProjectCard xl:grid-cols-4
              imgSrc="card-symptomatik-ai.png"
              title="SymptoMatik-AI"
              subtitle="An AI-Powered Symptom Ranking and Diagnostic Assistant for Healthcare Professionals"
              description="Developed a web application leveraging AI to assist healthcare professionals in ranking symptoms and suggesting potential diagnoses. Features include a responsive interface, intelligent symptom prioritization, and interactive recommendations to support clinical decision-making and improve diagnostic efficiency."
              previewLink="https://symptomatik-ai.vercel.app/sign-in"
              codeLink="https://github.com/dreyyan/symptomatik-ai"
            />
            <ProjectCard
              imgSrc="card-happy-pill-bar-and-resto.png"
              title="Happy Pill - Bar & Resto"
              subtitle="A Vibrant Bar & Restaurant Showcasing Menu, Ambiance, and Events"
              description="Designed and developed a promotional website for a one-stop bar and restaurant, showcasing menu items, ambiance, and entertainment offerings while enhancing online presence and customer engagement for local clientele."
              previewLink="https://www.happypillbar.com/home"
              codeLink="https://github.com/dreyyan/happy-pill"
            />
            <ProjectCard
              imgSrc="card-snippify.png"
              title="Snippify"
              subtitle="Personal Code Snippet Hub for Creating, Organizing, and Sharing Code"
              description="Developed a web-based platform for developers to efficiently create, organize, and share reusable code snippets. Features include tagging, search functionality, and a clean user interface designed to streamline coding workflows and improve productivity."
              codeLink="https://github.com/dreyyan/snippify"
            />
            <ProjectCard
              imgSrc="card-gigsta.png"
              title="Gigsta"
              subtitle="The Lightning-Fast Marketplace for Real Freelance Work"
              description="Developed a responsive freelance marketplace web application designed to connect clients and freelancers quickly and efficiently. Features include streamlined job posting, talent discovery, project matching, and a clean user interface to optimize workflow and reduce transaction time."
              codeLink="https://github.com/dreyyan/gigsta"
            />
          </div>

          <div className="text-center">
            <button onClick={() => setOtherProjects(true)}>
              <p
                className="relative inline-block text-[var(--text-secondary)] font-medium cursor-pointer
                after:content-[''] after:absolute after:bottom-0 after:h-[1px] 
                after:bg-[var(--text-primary)] after:left-1/2 after:-translate-x-1/2 
                after:w-0 hover:after:w-full after:transition-all after:duration-300"
              >
                Other Projects →
              </p>
            </button>
          </div>
        </>
      ) : (
        <>
            {/* [BUTTON] Back */}
            <button
                onClick={() => setOtherProjects(false)}
                className="fixed top-20 left-4 z-50 flex items-center gap-2 bg-[var(--secondary-background)] rounded-lg px-3 py-2 shadow-md hover:bg-[var(--card)] transition cursor-pointer"
            >
                <span className="text-[var(--text-primary)] font-bold">←</span>
                <span className="text-[var(--text-secondary)] font-medium">Back</span>
            </button>

          <p className="font-heading font-black text-5xl text-center mb-8">
            OTHER PROJECTS
          </p>

            {/* Category Filter Dropdown */}
            <div className="relative w-full mb-8">
            {/* Custom left arrow */}
            <span className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400 pointer-events-none">
                ▼
            </span>

            <select
                value={selectedCategory}
                onChange={(e) => setSelectedCategory(e.target.value)}
                className="appearance-none pl-8 pr-4 py-2 w-full border border-gray-300 rounded-lg bg-[var(--secondary-background)] text-[var(--text-secondary)]"
            >
                {categories.map((cat) => (
                <option key={cat} value={cat}>
                    {cat}
                </option>
                ))}
            </select>
            </div>

          {/* Filtered Projects Grid */}
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-8 mb-8">
            {filteredProjects.map((project, index) => (
                <OtherProjectCard
                key={index}
                title={project.title}
                category={project.category}       // ← now displayed as badge
                skills={project.skills}           // ← displayed as badges
                description={project.description}
                />
            ))}
          </div>
        </>
      )}
    </div>
  );
};

export default Portfolio;