interface SecondaryButtonProps {
  text: string;
  iconSrc?: string;
};

const SecondaryButton: React.FC<SecondaryButtonProps> = ({ text, iconSrc }) => {
  return (
    <div
      className="
        group
        flex items-center justify-center
        w-auto
        md:w-full
        px-4 py-2
        text-[var(--color-accent)] hover:text-[var(--text-secondary)]
        rounded-lg border border-[var(--border-color)] hover:border-[var(--text-secondary)]
        transition-colors duration-300
        cursor-pointer
      "
    >
      {iconSrc && (
        <div className="relative w-4 h-4 mr-[6px] mt-[1px]">
          {/* Default icon */}
          <img
            src={iconSrc}
            alt="Icon"
            className="
              absolute inset-0
              w-4 h-4
              opacity-100
              group-hover:opacity-0
              transition-opacity duration-300
            "
          />

          {/* Hover icon */}
          <img
            src={iconSrc.replace('.svg', '-hover.svg')}
            alt="Icon Hover"
            className="
              absolute inset-0
              w-4 h-4
              opacity-0
              group-hover:opacity-100
              transition-opacity duration-300
            "
          />
        </div>
      )}

      <p className="font-heading font-medium text-[14px]">
        {text}
      </p>
    </div>
  );
};

export default SecondaryButton;
