import React from 'react';
import Header from './Header';
import AdCard from './AdCard';

const RecentsAds = () => {
  return (
    <main className="main-content">
      <h2>Annonces récentes</h2>
      <div className="recent-ads">
        <AdCard 
          title="Table"
          imgUrl="/images/table.webp"
          price={75}
          link="/ads/table"
        />
      </div>

      
    </main>
  );
};

export default RecentsAds;
