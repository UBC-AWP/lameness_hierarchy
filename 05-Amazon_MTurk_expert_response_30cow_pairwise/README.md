# Expert Response for Pairwise Lameness Assessment on Amazon MTurk Sandbox

This folder contains code and data for launching, collecting, and processing expert responses via Amazon Mechanical Turk Sandbox for pairwise lameness comparisons.

## Directory Structure

- **code/**: Python scripts for launching and processing MTurk HITs
  - `53HIT_expert_10q_launch_collect.py`: Main script for launching & collecting response of 53 HITs with 10 questions each
  - `53HIT_expert_10q_launch_collect_helper.py`: Helper functions for the launch script
  - `pairwise_further_processing.py`: Script for additional processing of response responses
  - `pairwise_further_processing_helper.py`: Helper functions for further processing
  - `relaunch_html_video_not_play.py`: Script to relaunch HITs where videos failed to load
  - `relaunch_html_video_not_play_helper.py`: Helper functions for relaunching HITs

- **results/**: Data files containing expert responses and analysis
  - `Amazon_HIT_expert_submission_track_master.xlsx`: Master tracking file for all HIT submissions
  
  - **all_experts/**: Combined data from all experts
    - `all_HIT_answer_DW_NV_SB_KI.csv`: Combined HIT answers from experts DW, NV, SB, KI
    - `cowLR_response_*.csv`: Pairwise comparison responses by expert, with each row record the ID of cow shown on the left and the ID of cow shown on the right
    - `master_all_responses_*.csv`: Master files containing all responses by date and expert
    - `test_HIT_q.csv`: test HIT questions
    - `winner_loser_*.csv`: Pairwise comparison responses by each expert, with each row record the winner cow (the cow considered more lame) and the loser cow (the cow considered less lame)
    - `winner_loser_merged_DW_NV_SB_KI.csv`: Merged pairwise comparison responses across all experts, with each row record the winner cow (the cow considered more lame) and the loser cow (the cow considered less lame), and the expert name
    - `winner_loser_avg_DW_NV_SB_KI.csv`: Averaged pairwise comparison responses across all experts, with each row record the winner cow (the cow considered more lame) and the loser cow (the cow considered less lame)
  
  - **DW/**: Expert DW response files
    - `all_submitted_tracker_Apr-25-2023.csv`: Tracker for all submissions
    - `HIT0submitted_tracker_Apr-25-2023.csv`: Tracker for HIT0 submissions
    - `master_all_responses_*.csv`: All responses grouped by date; files contain a combination of approved and rejected responses
    - `master_approved_responses_May-*.csv`: Approved responses by date
    - `master_rejected_responses_May-*.csv`: Responses flagged for rejection
    - `master_worker_response_tracker_*.csv`: URL to track worker/experts response by date
    - `re_submitted_tracker_*.csv`: Files track HITs that were resubmitted due to video loading issues
  
  - **KI/**: Expert KI response files (similar structure to DW)
  
  - **NV/**: Expert NV response files (similar structure to DW)
  
  - **SB/**: Expert SB response files (similar structure to DW)

## Data Files Description

### Amazon_HIT_expert_submission_track_master.xlsx

Master tracking file containing submission information for all HITs across all experts:

- `Task_type`: Type of task (pairwise, pairwise_resub)
- `Date`: Date when the task was launched
- `expert`: Expert identifier (DW, NV, SB, RD)
- `submission_file_name`: Name of the file containing submission data
- `response_collected`: Name of the file where responses were collected
- `Further_process`: File name containing response data post further processing
- `note`: Additional notes or observations

### all_experts/all_HIT_answer_*.csv

- `cow_L`: Left cow identifier (numerical ID)
- `cow_R`: Right cow identifier (numerical ID)
- `response_mean`: Averaged expert response for this cow pair comparison (range: typically -3 to +3)

### all_experts/test_HIT_q.csv

- `cow_L`: Left cow identifier
- `cow_R`: Right cow identifier
- `response_sd`: Standard deviation of expert responses for this cow pair
- `response_mean`: Mean of expert responses for this cow pair (negative value indicates left cow rated as more lame)
- `response_mean_abs`: Absolute value for degree of lameness difference in comparison (i.e., how much more lame is winner against loser cow?)

### Winner-Loser Files (winner_loser_*.csv, winner_loser_merged_*.csv)

- `winner`: Cow ID identified as being rated as more lame
- `loser`: Cow ID identified as being rated as less lame
- `degree`: Degree of lameness difference in comparison (i.e., how much more lame is winner against loser cow?)
- `expert`: Expert identifier (DW, KI, NV, SB) who made the assessment

### Winner-Loser Average Files (winner_loser_avg_*.csv)

- `winner`: Cow ID identified as being rated as more lame
- `loser`: Cow ID identified as being rated as less lame
- `degree`: Degree of lameness difference in comparison (i.e., how much more lame is winner against loser cow?)
- `expert`: Indicates this is an average (e.g., "avg_D_N_S_K" for average of experts DW, NV, SB, KI)

### Tracker Files (all_submitted_tracker_*.csv, HIT0submitted_tracker_*.csv, re_submitted_tracker_*.csv)

- `HIT`: HIT number
- `HIT_id`: Unique identifier for the HIT
- `HIT_website_address`: URL to the HIT on MTurk
- `HIT_results_address`: URL to access the results on MTurk

### Response Tracker Files (master_worker_response_tracker_*.csv)

- `HIT`: HIT number
- `HIT_id`: Unique identifier for the HIT
- `HIT_website_address`: URL to the HIT on MTurk
- `HIT_results_address`: URL to access the results
- `HIT_status`: Status of the HIT (Assignable, Completed)
- `submitted_assignments`: Number of submitted assignments
- `Worker_id`: Expert identifier
- `Assignment_id`: Unique assignment identifier
- `Accept_time`: Time when the HIT was accepted
- `Submit_time`: Time when the HIT was submitted
- `Full_response`: JSON-formatted full response
- `isBot`: Flag indicating if the response is from a bot (FALSE)
- `assignment_status`: Status of the assignment (Approved)
- `q1` to `q10`: Responses to individual questions (-3 to 3 scale)

### Response Files Post Further Processing (master_all_responses_*.csv, master_approved_responses_*.csv, master_rejected_responses_*.csv)

- `HIT`: HIT number
- `HIT_id`: Unique identifier for the HIT
- `HIT_website_address`: URL to the HIT on MTurk
- `HIT_results_address`: URL to access the results
- `HIT_status`: Status of the HIT (Assignable, Completed)
- `submitted_assignments`: Number of submitted assignments
- `Worker_id`: Expert identifier
- `Assignment_id`: Unique assignment identifier
- `Accept_time`: Time when the HIT was accepted
- `Submit_time`: Time when the HIT was submitted
- `Full_response`: JSON-formatted full response
- `isBot`: Flag indicating if the response is from a bot (FALSE)
- `assignment_status`: Status of the assignment (Approved)
- `q1` to `q10`: Responses to individual questions (-3 to 3 scale)
- `passed_negative_attention`: Flag indicating if negative attention check was passed (Y/N)
- `passed_positive_attention_easy`: Flag indicating if positive attention check was passed (Y/N)
- `score_all`: Overall score of accuracy for the HIT (in reference to gait score; note this is not used in final analysis)
- `score_gs_more_than1`: Score of accuracy only for questions with GS difference > 1 (note this is not used in final analysis)
- `score_gs_less_than1`: Score of accuracy for questions with GS difference < 1 (note this is not used in final analysis)
- `correct_questions`: List of correctly answered questions
- `incorrect_questions`: List of incorrectly answered questions

### Cow Left-Right Comparison Files (cowLR_response_*.csv)

- `cow_L`: Left cow identifier
- `cow_R`: Right cow identifier
- `cow_L_URL`: URL to video of left cow
- `cow_R_URL`: URL to video of right cow
- `cow_L_GS`: Gait score of left cow
- `cow_R_GS`: Gait score of right cow
- `GS_dif`: Difference between left and right gait scores
- `question_type`: Type of question (pos_attention, neg_attention)
- `question_num`: Question number in the HIT
- `HIT`: HIT identifier
- `question_id`: Question identifier written as HIT number followed by question number
- `pair_id`: Unique pair identifier for comparison

## Notes

- Rejection files (`master_rejected_responses_*.csv`) are mostly empty as the rejection function was implemented to flag tasks that failed attention checks, but we never rejected any HIT. We approved all HITs.
