import ExperienceCard from "./components/ExperienceCard";
import SocialLink from "./components/SocialLink";

const skills = [
  {
    category: "FRONTEND",
    items: [
      "React",
      "React Native",
      "JavaScript/TypeScript",
      "HTML5/CSS3",
    ],
  },
  {
    category: "BACKEND",
    items: [
      "Node.js",
      "Express.js",
      "Flask",
      "MySQL",
      "PostgreSQL",
      "MongoDB",
      "SQLite",
      "SQLAlchemy",
    ],
  },
  {
    category: "TOOLS & PLATFORMS",
    items: [
      "Git/GitHub",
      "VSCode",
      "Vercel",
      "Netlify",
      "Postman",
      "Figma",
      "Canva",
    ],
  },
];

const Resume = () => {
    return (
        <div className="flex flex-col w-auto h-auto py-16 px-10">
            <p className="font-heading font-black text-5xl text-center mb-12">RESUME</p>

            <div className="flex flex-col gap-12 px-0 sm:px-8 md:px-16">
                {/* Header */}
                <div>
                    {/* About Me - Role & Education */}
                    <div className="mb-20 space-y-4">
                        <p className="font-heading font-bold text-3xl sm:text-4xl md:text-5xl tracking-widest">ADRIAN TAN</p>

                        <div className="sm:flex gap-x-2 [&>p]:font-heading [&>p]:font-bold [&>p]:text-lg [&>p]:sm:text-xl [&>p]:md:text-2xl">
                        <p>WEB DEVELOPER</p>
                        <p className="hidden sm:block">◦</p>
                        <p>TECHNOPRENEUR</p>
                        </div>

                        <div className="space-y-1">
                            <p className="font-heading font-bold text-sm sm:text-md md:text-lg">BS COMPUTER SCIENCE</p>
                            <p className="font-heading italic text-sm sm:text-md md:text-lg">WEST VISAYAS STATE UNIVERSITY (2028)</p>
                        </div>

                        {/* Social Links */}
                        <div className="flex flex-col items-start gap-3 my-12">
                            <SocialLink text="adriandominic.tan@wvsu.edu.ph" url="mailto:adriandominic.tan@wvsu.edu.ph" iconSrc="resume-email-icon.svg" />
                            <SocialLink text="github.com/dreyyan" url="https://github.com/dreyyan" iconSrc="resume-github-icon.svg" />
                            <SocialLink text="linkedin.com/dreyyan" url="https://linkedin.com/in/dreyyan" iconSrc="resume-linkedin-icon.svg" />
                            <SocialLink text="facebook.com/dreyyan0729" url="https://facebook.com/dreyyan0729" iconSrc="resume-facebook-icon.svg" />
                        </div>
                    </div>
                </div>

                <h2 className="text-2xl font-bold text-center">EXPERIENCE</h2>
                {/* Experience Section */}
                <div className="flex flex-col gap-8 md:grid md:grid-cols-2 md:gap-x-12">
                    <ExperienceCard
                        title="Freelance Web Developer"
                        iconUrl="/freelance-web-developer-icon.svg"
                        category="Self-Employed"
                        yearRange="2022 - Present"
                        description={[
                        "Developed and maintained websites for small businesses and personal projects using HTML, CSS, JavaScript, and React.",
                        "Collaborated with clients to gather requirements, provide updates, and ensure satisfaction with the final product.",
                        "Implemented responsive design principles to ensure optimal user experience across various devices."
                        ]}
                    />

                    <ExperienceCard
                    title="Data Scientist"
                    iconUrl="/data-scientist-icon.svg"
                    category="AI / Analytics Team"
                    yearRange="2023 - Present"
                    description={[
                        "Built and evaluated machine learning models for prediction and classification tasks using Python and scikit-learn.",
                        "Performed data cleaning, feature engineering, and exploratory data analysis on structured datasets.",
                        "Created visualizations and reports to communicate model insights and performance metrics."
                    ]}
                    />
                </div>

                {/* Education Section */}
                <div className="flex flex-col">
                    <h2 className="text-2xl font-bold text-center">EDUCATION</h2>
                    <div className="space-y-2 mt-3 mb-8">
                        <p className="font-heading font-medium text-sm tracking-[6px] text-center">BS COMPUTER SCIENCE</p>
                        <p className="font-heading italic font-regular text-xs tracking-[2px] text-center">
                        WEST VISAYAS STATE UNIVERSITY (2028)
                        </p>
                    </div>

                    <h4>RELEVANT COURSES</h4>
                    <ul className="list-disc list-inside space-y-1 mt-2">
                    <li>Web Development</li>
                    <li>Human-Computer Interaction</li>
                    <li>Software Engineering</li>
                    <li>Systems Analysis & Design</li>
                    </ul>
                </div>

                <div className="flex flex-col space-y-12">
                <h2 className="text-2xl font-bold text-center">SKILLS</h2>

                {skills.map((skillGroup) => (
                    <div
                    key={skillGroup.category}
                    className="flex flex-col space-y-2"
                    >
                    <h4 className="font-semibold">
                        {skillGroup.category}
                    </h4>

                    <ul className="list-disc list-inside space-y-1 mt-2">
                        {skillGroup.items.map((skill) => (
                        <li key={skill}>{skill}</li>
                        ))}
                    </ul>
                    </div>
                ))}
                </div>

                {/* Download CV */}
                <div className="flex justify-center items-center">
                    <a href="resume_web_development.pdf" download
                    className="relative text-[var(--text-secondary)] font-medium
                    after:content-[''] after:absolute after:bottom-0 after:h-[1px] 
                    after:bg-[var(--text-primary)] after:left-1/2 after:-translate-x-1/2 
                    after:w-0 hover:after:w-full after:transition-all after:duration-300"
                    >Download CV →</a>
                </div>
            </div>
        </div>
    );
};

export default Resume;