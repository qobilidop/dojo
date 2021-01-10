"""
https://leetcode.com/problems/find-minimum-time-to-finish-all-jobs/
"""
class Solution:
    def minimumTimeRequired(self, jobs, k):
        jobs = sorted(jobs)
        n_job = len(jobs)
        worker = [0] * k
        min_max_working_time = sum(jobs)

        def backtrack(i_job):
            nonlocal min_max_working_time

            if i_job == n_job:
                min_max_working_time = min(max(worker), min_max_working_time)
                return

            new_job_time = jobs[i_job]
            seen_worker = set()
            for i_worker in range(k):
                if worker[i_worker] in seen_worker or worker[i_worker] + new_job_time >= min_max_working_time:
                    continue
                seen_worker.add(worker[i_worker])
                worker[i_worker] += new_job_time
                backtrack(i_job + 1)
                worker[i_worker] -= new_job_time

        backtrack(0)
        return min_max_working_time
