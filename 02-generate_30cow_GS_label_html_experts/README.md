# Generating HTML for Remote Lameness Gait Scoring

This folder contains code and data for generating HTML-based labeling interfaces for cow gait score assessment by experts.

## Directory Structure

- **code/**: Python scripts for generating the HTML labeling interface
  - `Create_gs_labeling_HTML.py`: Main script that generates the HTML interface
  - `Create_gs_labeling_HTML_helper.py`: Helper functions for the main script
  - **code/input_file/**: HTML/CSS/JavaScript components stored as text files
    - `p1_css.txt`: CSS styling for the labeling interface
    - `p2_html_q1.txt`: HTML template for the first question in the HTML
    - `p2_html_other_q.txt`: HTML template for additional questions (other than question 1) in the HTML
    - `p3_js.txt`: JavaScript functionality for the labeling interface

- **results/**: Generated files for gait score labeling
  - `GS_30cows_HIT0_Jun-04-2023.csv`: Primary CSV data file recording the URL of videos of 30 cows
  - `GS_30cows_HIT0_Jun-04-2023_slip_label.csv`: CSV file recording the URL of videos of 30 cows, but also manually noted for cows that slipped in each video (Y = Yes)
  - `GS_30cows_HIT0_Jun-04-2023.html`: Generated HTML interface for labeling

## Data Files Description

### GS_30cows_HIT0_Jun-04-2023.csv
- `file_name`: Complete compressed video filename with details
- `date`: Recording date (MM/DD/YY format)
- `cow_id`: Cow identifier
- `URL`: Full URL to the video on cloud storage on Amazon S3
- `question_num`: Question identifier for the labeling interface

### GS_30cows_HIT0_Jun-04-2023_slip_label.csv
- `file_name`: Compressed video file name
- `date`: Recording date (MM/DD/YY format)
- `cow_id`: Cow identifier
- `URL`: URL to the video hosted on cloud storage on Amazon S3
- `question_num`: Question identifier
- `Slipped`: Flag indicating if cow slipped during gait (Y = Yes)