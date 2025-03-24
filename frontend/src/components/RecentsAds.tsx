import AdCard from "./AdCard";

const RecentsAds = () => {
  const ads = [
    {
      title: "Table",
      imgUrl: "/images/table.webp",
      price: 75,
      link: "/ads/table",
    },

    {
      title: "dame-jeanne",
      imgUrl: "/images/dame-jeanne.webp",
      price: 75,
      link: "/ads/dame-jeanne",
    },

    {
      title: "porte-magazine",
      imgUrl: "/images/porte-magazine.webp",
      price: 75,
      link: "/ads/porte-magazine",
    },

    {
      title: "vaisselier",
      imgUrl: "/images/vaisselier.webp",
      price: 75,
      link: "/ads/vaisselier",
    },

    {
      title: "vide-poche",
      imgUrl: "/images/vide-poche.webp",
      price: 75,
      link: "/ads/vide-poche",
    },

    {
      title: "bougie",
      imgUrl: "/images/bougie.webp",
      price: 75,
      link: "/ads/bougie",
    },
  ];

  return (
    <>
      <h2>Annonces récentes</h2>
      <section className="recent-ads">
        {ads.map((ad, index) => (
          <AdCard
            title={ad.title}
            imgUrl={ad.imgUrl}
            price={ad.price}
            link={ad.link}
          />
        ))}
      </section>
    </>
  );
};

export default RecentsAds;
