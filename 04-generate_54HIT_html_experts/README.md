# Generating HTML for 54 Human Intelligence Tasks to Do Pairwise Lameness Assessment by Experts

This folder contains code and data for generating HTML-based interfaces for 54 Human Intelligence Tasks (HITs) related to pairwise lameness assessment conducted by experts.

## Directory Structure

- **code/**: Python scripts for generating the HTML interfaces
  - `Create_54HITs_experts_HTML.py`: Main script that generates the HTML interfaces
  - `Create_54HITs_experts_HTML_helper.py`: Helper functions for the main script
  - **input_file/**: HTML/CSS/JavaScript components stored as text files
    - `p1_css.txt`: CSS styling for the labeling interface
    - `p2_html_q1.txt`: HTML template for the first question
    - `p2_html_other_q.txt`: HTML template for additional questions
    - `p3_js.txt`: JavaScript functionality for the interface

- **results/**: Generated files for HITs
  - `all_HIT_answer.csv`: Combined answers from all HITs
  - `platform_example_short.gif`: Example GIF showing the platform interface (displayed at the landing page of GitHub repository of this project)
  - **Individual HIT files** (HIT0-HIT53):
    - `HIT*.html`: HTML interface files for each HIT (0-53)
    - `HIT*_answer.csv`: Recorded expert response for pairwise comparison data files for each HIT (0-53)

## Data Files Description

### all_HIT_answer.csv
- `cow_L`: Left cow identifier
- `cow_R`: Right cow identifier
- `cow_L_URL`: URL to video of left cow
- `cow_R_URL`: URL to video of right cow
- `cow_L_GS`: Gait score of left cow
- `cow_R_GS`: Gait score of right cow
- `GS_dif`: Difference between left and right gait scores
- `question_type`: Type of question (e.g., pos_attention (positive attention check), neg_attention (negative attention check))
- `question_num`: Question number (q1, q2, etc.)
- `HIT`: HIT identifier
- `question_id`: Question identifier
- `pair_id`: Unique pair identifier for every 2 cow comparison

### Individual HIT Answer Files (HIT0_answer.csv to HIT53_answer.csv)
All files with pattern `HIT*_answer.csv` contain:
- `cow_L`: Left cow identifier
- `cow_R`: Right cow identifier
- `cow_L_URL`: URL to video of left cow
- `cow_R_URL`: URL to video of right cow
- `cow_L_GS`: Gait score of left cow
- `cow_R_GS`: Gait score of right cow
- `GS_dif`: Difference between left and right gait scores
- `question_type`: Type of question (e.g., pos_attention, neg_attention)
- `question_num`: Question number (q1, q2, etc.)
- `HIT`: HIT identifier
- `question_id`: Question identifier (HIT number followed by question number)
- `pair_id`: Unique pair identifier for every 2 cow comparison

### HTML Files (HIT0.html to HIT53.html)
These are generated HTML interface files that include:
- Side-by-side video comparison of two cows
- Interface for experts to assess and compare gait scores
- Interactive elements for scoring and submission
- Embedded CSS styling and JavaScript functionality
