WITH analise_campaign AS (
  SELECT company as Company, Channel_Used, Location, AVG(Acquisition_Cost) as Acquisition_Cost_Media, AVG(ROI) as Media_ROI, AVG(Conversion_Rate) as Conversion_Rate_Media, COUNT(*) as Total_Campanhas, RANK() OVER(PARTITION BY Location ORDER BY AVG(ROI) DESC) AS Rank_ROI_Per_Location
  FROM `linen-lens-483722-d1.analise_campanha_marketing.analise_campanha`
  GROUP BY company, Channel_Used, Location
  )

  SELECT *
  FROM analise_campaign
  WHERE Rank_ROI_Per_Location <= 5
  ORDER BY Location, Rank_ROI_Per_Location ASC


