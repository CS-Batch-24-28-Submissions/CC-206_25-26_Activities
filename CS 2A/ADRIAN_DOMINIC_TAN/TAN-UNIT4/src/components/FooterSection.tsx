import type React from "react";

interface FooterSectionProps {
  iconSrc: string;
  title: string;
  description: string | string[];
  onClick?: () => void;
}

const FooterSection: React.FC<FooterSectionProps> = ({
  iconSrc,
  title,
  description,
  onClick,
}) => {
  const renderDescription = () => {
    if (Array.isArray(description)) {
      return description.map((item, index) => (
        <span key={index}>
          {item}
          {index !== description.length - 1 && <br />}
        </span>
      ));
    }

    return description;
  };

  const descriptionClasses =
    "footer-caption text-[var(--text-secondary)] text-center md:text-left" +
    (onClick ? " cursor-pointer hover:underline" : "");

  return (
    <div className="flex flex-col items-center text-center gap-3 md:flex-row md:items-start md:text-left sm:px-12 md:px-20">
      {/* Icon */}
      <img
        src={iconSrc}
        alt={title}
        className="w-7 h-7 shrink-0"
      />

      {/* Text Content */}
      <div className="flex flex-col items-center md:items-start">
        <p className="footer-title font-semibold">{title}</p>

        <p className={descriptionClasses} onClick={onClick}>
          {renderDescription()}
        </p>
      </div>
    </div>
  );
};

export default FooterSection;