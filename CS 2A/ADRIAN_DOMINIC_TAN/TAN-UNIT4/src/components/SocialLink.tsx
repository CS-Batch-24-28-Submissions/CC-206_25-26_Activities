interface SocialLinkProps {
    text: string;
    url: string;
    iconSrc: string;
}

const SocialLink: React.FC<SocialLinkProps> = ({ text, url, iconSrc }) => {
    return (
        <div>
            <a
                href={url}
                target="_blank"
                rel="noopener noreferrer"
                className="flex gap-x-2 justify-center items-center"
            >
                <img src={iconSrc} alt="Social Link" className="size-7" />
                
                {/* Text with animated underline */}
                <span className="relative after:content-[''] after:absolute after:left-0 after:-bottom-[-3px] after:h-[1px] after:bg-current after:w-0 after:transition-all after:duration-200 after:delay-150 hover:after:w-full">
                    {text}
                </span>
            </a>
        </div>
    );
};

export default SocialLink;
