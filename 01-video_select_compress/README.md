# Video Selection and Compression

This folder contains code and data for selecting, processing, and compressing cow lameness assessment videos.

## Directory Structure

- **code/**: Python scripts for video processing
  - `change_mp4_file_name.py`: Utility for renaming MP4 files with consistent naming convention
  - `compress_video.py`: Script to compress video files to reduce storage requirements
  - `count_all_mp4.py`: Main script for counting and cataloging all MP4 files by cow ID
  - `count_all_mp4_helper.py`: Helper functions used by the main counting script

- **results/**: Data files generated from video processing
  - `artificial_group_all_marked.csv`: Dataset containing cow identifiers with gait scores
  - `Manual Dataframe Task (April 11).xlsx`: Comparison worksheet for different gait scores
  - `videos_per_cow_count.csv`: Count of available videos per cow identifier

## Data Files Description

### artificial_group_all_marked.csv

- `Cow`: Numeric identifier for each cow
- `date`: Date of observation (MM/DD/YY format)
- `GS`: Gait Score - numerical evaluation of lameness (1-5 scale)
- `got`: Observation status (Y = manually played)
- `note`: Additional observations, particularly for questionable scores

### Manual Dataframe Task (April 11).xlsx

- `cow_L` and `cow_R`: The ID of cow displayed on the left and the ID of cow displayed on the right.
- Comparison notation showing differences between gait scores (e.g., "GS 4 vs GS 2 (diff = 2)")
- Reference table with original scoring data from `artificial_group_all_marked.csv`

### videos_per_cow_count.csv

- `Subfolder`: Cow identifier number
- `MP4Count`: Number of video recordings available for each cow
