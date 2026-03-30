interface SocialButtonProps {
    href?: string;
    children?: React.ReactNode;
};

const SocialButton: React.FC<SocialButtonProps> = ({ href, children }) => {
    return (
        <a
        href={href} target="_blank" rel="noopener noreferrer"
        className="
        flex justify-center items-center size-12 rounded-full cursor-pointer
        border border-[var(--border-color)]
        duration-200 ease-in-out transition transform

        hover:scale-110 hover:rotate-4
        ">
            {children}
        </a>
    );
};

export default SocialButton;