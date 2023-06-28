# ML Checklist

## 1. Frame the problem and look at the big picture

### Big Picture

- The dataset we'll be working with consists of data that includes metrics such as population, median income, and median housing price for each block group in California
  > Block groups are the smallest geographical unit for which the US Census Bureau publishes sample data (a block group typically has a population of 600 - 3000 people)

**Objective**:

- Make our model learn from this data and able to predict the median housing price in any district, given all the other metrics

### Frame the Problem

- **Knowing the objective is important because it will determine**

  1. how we frame the problem, which algorithms we will select,
  2. which performance measure we will use to evaluate our model, and
  3. how much effort we will spend tweaking it.

- **Knowing what current solution looks like will give us**
  1. a reference for performance
  2. insights on how to solve the problem
