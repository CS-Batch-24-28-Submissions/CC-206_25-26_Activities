interface OtherProjectCardProps {
  title: string;
  category: string;
  skills?: string[];
  description: string;
}

const OtherProjectCard: React.FC<OtherProjectCardProps> = ({
  title,
  category,
  skills = [],
  description,
}) => {
  const textLine = [category, ...skills].join(" · ");

  return (
    <div className="rounded-xl shadow-lg overflow-hidden bg-[var(--secondary-background)] flex flex-col w-full max-w-sm">
      <div className="bg-[var(--card)] rounded-b-[14px] h-full">
        <div className="px-4 py-4 flex flex-col gap-3">
          <h3 className="font-heading font-bold text-xl">{title}</h3>

          {/* Desktop badges */}
          <div className="hidden md:flex flex-wrap gap-2">
            <span className="text-xs font-semibold bg-[var(--primary-color)] text-white px-2 py-1 rounded-full">
              {category}
            </span>
            {skills.map((skill, i) => (
              <span
                key={i}
                className="text-xs font-medium bg-gray-200 text-gray-700 px-2 py-1 rounded-full"
              >
                {skill}
              </span>
            ))}
          </div>

          {/* Mobile single-line text */}
          <div className="md:hidden text-sm text-[var(--text-secondary)]/50">
            {textLine}
          </div>

          <p className="font-body text-sm text-[var(--text-secondary)]">{description}</p>
        </div>
      </div>
    </div>
  );
};

export default OtherProjectCard;