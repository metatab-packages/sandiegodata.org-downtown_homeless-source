# Source Package for Downtown Homeless Sleepers

This dataset provides geographic locations for homeless sleepers in Downtown San Diego, as counted by enumerators from the Downtown San Diego Partnership. These counts have been done monthly since 2012, and this dataset provides counts since 2014. 

This is the source package, use to generate analysis packages. Analysts should probably use one of the analysis packages. See the [Data Library's Homelessness Collection](https://data.sandiegodata.org/collections/homelessness/) for all of the available datasets. 

The count is done on paper maps with handwritten count marks. The San Diego
Regional Data Library's [Downton Homelessness
project](http://downtown-homelessness.sandiegodata.org/) converted these
scanned count maps using a [web based image annotation
tool, VIA](http://www.robots.ox.ac.uk/~vgg/software/via/). These data are extracted from the JSON output from VIA. 

This package has two top level files, and four predecessor files. The top level files are: 

* ``counts``. One record for each handwritten count marking on a map. 
* ``files``. One record for each of the scanned, handmarked maps. 

The predecessor files are: 

* ``raw_file_annotations``. File annotations extracted from the VIA output.
* ``raw_count_annotations``. Count annotations extracted from the VIA output.
* ``raw_gcp``. Ground control point annotations ( street intersections ) extracted from VIA.
* ``gcp_transforms``. Ground control points, in both image and geographic coordinates, with an affine transformation matrix to convert between them. 
* ``intersections``. Geographic positions and names of the street intersections used as ground control points. 

## Caveats

Because this data is extracted, manually, from manually recorded maps, there
are a lot of quality issues. 

### Missing Months

Because of conversion errors and some complications with the source maps, there
are several months of data that are excluded from this dataset

* **August 2014**. In the original datasets, August 2014 was a duplicate of September 2014. 
* **September 2014**. Comfusion related to the duplication of September and August resulted in September being incompletely processed. 
* **June 2015**. All of the map images for this month were blank. An alternate source PDF exists that is not blank, but this file was not used.     


### Not Using Ocupancy Multipliers

Since about 2017, HUD has instructed point-in-time homeless counts to multiply
the counts of sleepers in structures and vehicles by factors to account for
people who may be obsured and not directly countable. From April 2017 on,
Downtown San Diego Partnership has been using these factors.

However, this dataset does not use the occupancy factors, to allow analysts to
apply these factors consistently across all months of data. As a result, the
counts from this dataset diverge from the official counts after March 2017.

### Other Issues 

* The ``total_count`` often does not match the sum of counts on the map. These sums were made by hand, by the enumerator who made the counts, so there are occasional arithmetic errors.  
* There are many instances of missing values for ``rain`` or ``temp``
* Some dates include the day of the month, but many don't These dates have a day of month of 1.
* Date day of month is generally unreliable. Only the year and month are reliable, except for files noted above. 
* The ``neighborhood`` value is based on the map names, so in some months
  the East Village neighborhood is separated into ``east_village`` and ``east_village_south``

### Comparison to Official Published Counts

This plot shows, per month, the offical published counts from San Diego Downtown Partnership versus the total from this dataset. Note the descrepancies dues to issues noted above, including missing months, minor differences in some months, and the divergence after March 2017 due to occupancy multiplers. 

<center><a href="https://data.sandiegodata.org/wp-content/uploads/sites/18/2019/10/homeless-new-vs-official.png"><img src="https://data.sandiegodata.org/wp-content/uploads/sites/18/2019/10/homeless-new-vs-official.png" width="700px"></a></center>


## Versions

1. Initial Release
2. Remap some neighborhoods
3. Map null neighborhood name ( '' ) to Gaslamp
4. Fixed missing dates in Columbia, 2016, incorrect dates in Marina 2016, and other errors
5. Excluded several months with quality problems, improved documentation
6. Added column for source file, removed duplicated data form marina, 2016
7. Added data for 2023 update.

## Acknowledgements


The May 2023 update was done by researchers at the Homelessness Hub at UC San Diego:

* Zhongqi Zheng
* Daniel Sjoholm
* Yao Fu

The 2024 update was performed by:

* Zhongqi Zheng
* Daniel Sjoholm
* Michael Yang
* Patricia Estaris
* Lily Keefauver
* 