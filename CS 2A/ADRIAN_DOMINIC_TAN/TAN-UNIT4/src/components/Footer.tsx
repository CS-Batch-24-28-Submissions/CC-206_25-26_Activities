import FooterSection from "./FooterSection";

const Footer = () => {
  return (
    <footer className="border-t border-[var(--text-primary)] bg-[var(--secondary-background)] text-[var(--text-primary)]">
      
      {/* Main Sections */}
      <div className="max-w-6xl mx-auto px-6 md:px-12 lg:px-20 py-10">
        <div className="flex flex-col sm:flex-row items-center sm:items-start justify-center sm:justify-between gap-8 text-center sm:text-left">
          
          <FooterSection
            iconSrc="address-icon.svg"
            title="Address"
            description="Iloilo City, PH"
            onClick={() => {
              const address = encodeURIComponent("Iloilo City, Philippines");
              window.open(
                `https://www.google.com/maps/search/?api=1&query=${address}`,
                "_blank"
              );
            }}
          />

          <FooterSection
            iconSrc="email-icon.svg"
            title="Email"
            description="adriandominic.tan@wvsu.edu.ph"
            onClick={() =>
              (window.location.href =
                "mailto:adriandominic.tan@wvsu.edu.ph")
            }
          />
        </div>

        {/* Divider */}
        <div className="border-t border-[var(--text-primary)]/20 mt-10 pt-6 text-center space-y-2">
          <p className="text-sm font-medium opacity-80">
            © 2024–{new Date().getFullYear()} Adrian Tan. All rights reserved.
          </p>

          <p className="text-xs opacity-70">
            • FULL-STACK WEB DEVELOPER • TECHNOPRENEUR •
          </p>
        </div>
      </div>
    </footer>
  );
};

export default Footer;