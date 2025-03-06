# Expert Response for Lameness Scoring

This folder contains code and data for launching, processing, and analyzing expert responses to the cow gait score assessment tasks.

## Directory Structure

- **code/**: Python and R scripts for data processing and analysis
  - `30_cow_gs_launch.py`: Main script for launching the assessment task on Amazon MTurk Sandbox
  - `30_cow_gs_launch_helper.py`: Helper functions for the launch script
  - `process_gs_response.py`: Script to process expert responses
  - `process_gs_response_helper.py`: Helper functions for response processing
  - `combine_5experts_rating.R`: R script for combining ratings from 5 experts
  - `combine_5experts_rating_helper.R`: Helper functions for the combining script

- **plots/**: Visualization outputs
  - `cor_change_by_round_expert_num_edited.png`: Plot showing correlation changes by round and expert number
  - `plot_edit.pptx`: PowerPoint file with edited plots

- **results/**: Data files with expert responses and analysis results
  - **HIT Tracker Files**: (Tracking all HIT submissions for different dates)
    - `all_submitted_trackerJun-04-2023.csv`
    - `all_submitted_trackerJul-03-2023.csv`
    - `all_submitted_trackerJul-17-2023.csv`
    - `all_submitted_trackerAug-30-2023.csv`
    - `all_submitted_trackerNov-11-2023.csv`
  
  - **Master Worker Response Files**: (Containing detailed worker responses)
    - `master_worker_response_tracker_Jun-04-2023.csv`
    - `master_worker_response_tracker_Jul-14-2023.csv`
    - `master_worker_response_tracker_Jul-18-2023.csv`
    - `master_worker_response_tracker_Anna-merickSep-10-2023.csv`
  
  - **Gait Score Response Files**: (Containing processed responses by date/expert)
    - `gs_response_Wali_Jul-10-2023.csv`
    - `gs_response_Wali_Jul-14-2023.csv`
    - `gs_response_Wali_Jul-18-2023.csv`
    - `gs_response_Aug-12-2023.csv`
    - `gs_response_Sep-10-2023.csv`
  
  - **Combined & Analysis Files**:
    - `gs_expert_manual_response.csv`: Manually recorded expert responses from HTML output
    - `gs_response_combined.csv`: Combined responses from all experts
    - `gs_response_combined_avg.csv`: Averaged scores from combined responses from all experts
    - `GS_label_submission_track_master.xlsx`: Master tracking sheet for all expert submissions
    - `icc_change_by_round_expert_num.csv`: ICC changes by round and expert number
    - `interobserver_reliability_by_rounds.csv`: Inter-observer reliability metrics
    - `intraobserver_reliability.csv`: Intra-observer reliability metrics

## Data Files Description

### HIT Tracker Files

All files with pattern `all_submitted_tracker*.csv` contain:

- `HIT`: the Human Intelligence Task (HIT) number (e.g., first HIT is numbered as 0)
- `HIT_id`: Unique identifier for the Human Intelligence Task
- `HIT_website_address`: URL for the HIT task
- `HIT_results_address`: URL for accessing results

### Master Worker Response Files

All files with pattern `master_worker_response_tracker_*.csv` contain:

- `HIT`: the Human Intelligence Task (HIT) number (e.g., first HIT is numbered as 0)
- `HIT_id`: Unique identifier for the HIT
- `HIT_website`: URL for the HIT
- `HIT_results`: URL for accessing results
- `HIT_status`: Current status of the HIT
- `submitted_assignments`: total number of assessments submitted by this worker
- `Worker_id`: expert account unique identifier
- `Assignment_id`: Unique assignment identifier
- `Accept_time`: Time the task was accepted
- `Submit_time`: Time the task was completed & submitted
- `Full_response`: The complete response in JSON format
- `isBot`: Flag indicating if the response was from a bot
- `assignment_status`: the status of this assignment (submitted or not)
- `q*`: Individual question responses (q1, q2, q3, etc.)
- `GS_round`: Round number of assessment

### Gait Score Response Files

All files with pattern `gs_response_*.csv` contain:

- `Cow`: Cow identifier number
- `date`: Video recording date (MM/DD/YY format)
- `question_num`: Question identifier in the HIT (e.g., q1, q2)
- `HIT`: the Human Intelligence Task (HIT) number (e.g., first HIT is numbered as 0)
- `Worker_id`: Expert identifier (e.g., DW, RD, AS, HE, SB)
- `GS_round`: Round number of assessment
- `GS`: Gait score assigned by the expert (1-5 scale)

### Combined & Analysis Files

#### gs_expert_manual_response.csv

- `Expert`: Expert identifier (e.g., DW, RD, AS, HE, SB)
- `Response`: JSON format response data that first author manually copied and pasted from HTML
- `html`: HTML name identifier
- `date`: Date of assessment
- `GS_round`: Round number of the assessment

#### gs_response_combined.csv

- `Cow`: Cow identifier number
- `date`: Recording date
- `question_num`: Question identifier (q1, q2, q3, etc.)
- `HIT`: the Human Intelligence Task (HIT) number (e.g., first HIT is numbered as 0)
- `Worker_id`: Expert identifier
- `GS_round`: Assessment round number
- `GS`: Gait score value

#### gs_response_combined_avg.csv

- `Cow`: Cow identifier number
- `GS`: Average gait score across experts

#### GS_label_submission_track_master.xlsx

- `Task_type`: Round number of the assessment (e.g., first round of assessment is noted as GS_1)
- `Date`: Date of task assignment
- `expert`: Expert identifier (e.g., DW, RD, AS, HE, SB)
- `submission_file_name`: Name of submitted file
- `response_collected`: Name of file with collected responses
- `Further_process`: Name of file with collected responses after further processing
- `note`: Additional notes or comments

#### icc_change_by_round_expert_num.csv

- `num_of_experts`: Total number of experts included in analysis
- `num_of_rounds`: Total number of assessment rounds
- `icc_mean`: Mean Intraclass Correlation Coefficient value
- `icc_SE`: Standard error of ICC
- `num_of_rounds_factor`: `num_of_rounds` as a factor variable

#### interobserver_reliability_by_rounds.csv

- `GS_round`: Assessment round number
- `interobserver_ICC`: Intraclass Correlation Coefficient between different experts

#### intraobserver_reliability.csv

- `Worker_id`: Expert identifier
- `ICC`: Intraclass Correlation Coefficient for repeated assessments by the same expert
