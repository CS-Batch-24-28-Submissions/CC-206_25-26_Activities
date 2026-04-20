interface ProjectCardProps {
  imgSrc?: string;
  title: string;
  subtitle?: string;
  description: string;
  previewLink?: string;
  codeLink: string;
}

const ProjectCard: React.FC<ProjectCardProps> = ({ imgSrc, title, subtitle, description, previewLink, codeLink }) => {
  const isPreviewDisabled = !previewLink;

  return (
    <div className="rounded-xl shadow-lg overflow-hidden bg-[var(--card)] flex flex-col w-full max-w-sm">
      {/* Responsive 4:3 image */}
      <div className="w-full aspect-[4/3] overflow-hidden rounded-t-[14px]">
        <img
          src={imgSrc}
          alt={title}
          className="w-full h-full object-cover flex justify-center items-center"
        />
      </div>

      <div className="bg-[var(--card)] rounded-b-[14px] flex flex-col flex-grow">
        <div className="px-4 py-4 flex flex-col gap-3 flex-grow">
          <h3 className="font-heading font-bold text-xl">{title}</h3>

          {/* Subtitle */}
          {subtitle ? (
            <p className="font-body text-sm font-medium text-gray-400 italic">{subtitle}</p>
          ) : null}

          <p className="font-body text-sm text-[var(--text-secondary)]">{description}</p>
        </div>

        {/* Buttons */}
        <div className="flex">
          <a
            href={isPreviewDisabled ? undefined : previewLink}
            target="_blank"
            rel="noopener noreferrer"
            className={`flex-1 flex justify-center items-center text-center text-sm font-bold py-1 rounded-bl-xl
                        transition-colors duration-300
                        ${isPreviewDisabled 
                          ? 'bg-gray-400 text-gray-200 cursor-not-allowed pointer-events-none' 
                          : 'text-[var(--text-primary)] bg-[var(--accent)] hover:bg-[var(--accent)]/80'
                        }`}
          >
            PREVIEW
          </a>

          <a
            href={codeLink}
            target="_blank"
            rel="noopener noreferrer"
            className="flex-1 flex justify-center items-center text-center text-sm font-bold text-[var(--color-accent)] py-1 rounded-br-xl border border-[var(--color-accent)]
                       transition-colors duration-300 hover:border-t-[var(--text-primary)]/80 hover:border-b-[var(--text-primary)]/80 hover:border-r-[var(--text-primary)]/80 hover:text-[var(--text-primary)]/80 focus:outline-none"
          >
            View Code →
          </a>
        </div>
      </div>
    </div>
  );
};

export default ProjectCard;
