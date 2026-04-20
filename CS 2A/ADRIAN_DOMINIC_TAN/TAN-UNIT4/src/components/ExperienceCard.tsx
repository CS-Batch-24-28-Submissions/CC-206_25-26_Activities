import type React from "react";

interface ExperienceCardProps {
    title: string;
    iconUrl: string;
    category: string;
    yearRange: string;
    description: string[];
}

const ExperienceCard: React.FC<ExperienceCardProps> = ({ title, iconUrl, category, yearRange, description }) => {
    return (
        <div className="relative bg-[var(--card)] pb-6 rounded-lg shadow-md hover:shadow-lg transition-shadow duration-300">
            <div className="flex mb-4">
                <div className="bg-[var(--secondary-background)] w-full rounded-tl-lg"></div>
                {/* Icon at top-right */}
                <div className=" bg-[var(--accent)] rounded-tr-lg p-2 py-1">
                    <img src={iconUrl} alt={title} className="size-8" />
                </div>
            </div>

            <div className="px-6 space-y-2">
                <div>
                    <h4 className="text-xl font-bold">{title}</h4>
                    <p className="text-sm text-gray-500 my-2 pb-3">{category} • {yearRange}</p>
                    <div className="w-full border-b"></div>
                </div>

                <ul className="list-disc list-inside space-y-2 mt-4">
                    {description.map((point, index) => (
                        <li key={index} className="text-[var(--text-secondary)]">
                            {point}
                        </li>
                    ))}
                </ul>
            </div>
        </div>
    );
};

export default ExperienceCard;
