import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.patches as patches
import numpy as np

obs = pd.read_csv('road1_fiber_ms50_r10.csv')
data = obs.values
plt.style.use('classic')
fig = plt.figure(figsize=(13, 2.5))
ax = fig.add_axes([0.05,0.22,0.92,0.75])

plt.plot(data[42*144:56*144-1,0],color="#006ea3",linewidth=0.4,label="Actual value")
plt.plot(data[42*144:56*144-1,2],color="#f79b5f",linewidth=1.8,label=r"Global parameter + biases")
plt.plot(data[42*144:56*144-1,3],color="#e3120b",linewidth=1.0,label="Estimated value")

ax.set_xlim([0, 14*144-1])
ax.set_ylim([0, 60])
ax.grid(color='gray', linestyle='-', linewidth=0.1, alpha=0.2)

for i in range(42,56):
    if data[144*i,1] > 0:
        someX, someY = (i-42)*144, 0
        currentAxis = plt.gca()
        ax.add_patch(patches.Rectangle((someX, someY), 144, 60,
                      alpha=0.1, facecolor='green'))

plt.xticks(np.arange(0, 14*144, 72),["00:00", "12:00", "00:00", "12:00",
                    "00:00", "12:00", "00:00", "12:00",
                    "00:00", "12:00", "00:00", "12:00",
                    "00:00", "12:00", "00:00", "12:00",
                    "00:00", "12:00", "00:00", "12:00",
                    "00:00", "12:00", "00:00", "12:00",
                    "00:00", "12:00", "00:00", "12:00"], rotation=30)
plt.yticks(np.arange(10,60,10),[10,20,30,40,50,60])
ax.set_ylabel("Speed (km/h)")
plt.legend(ncol=3, loc=4)

fig.savefig("time_series_speed2.pdf")