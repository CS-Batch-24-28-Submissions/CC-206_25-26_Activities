interface PrimaryButtonProps {
    label: string;
    onClick?: () => void;
};

const PrimaryButton: React.FC<PrimaryButtonProps> = ({ label, onClick }) => {
    return (
        <button className="
        md:w-full
        bg-[var(--color-accent)]
        text-[var(--text-primary)]
        text-sm
        font-heading
        font-semibold
        tracking-widest
        px-4 py-3
        rounded-md
        cursor-pointer
        transition-colors
        duration-300
        hover:bg-[var(--accent)]/80
        focus:outline-none
        "
        onClick={onClick}
        >
            {label}
        </button>
    );
};

export default PrimaryButton;