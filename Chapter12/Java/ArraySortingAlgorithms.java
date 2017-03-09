package main.java;

/**
 * Created by William Smith on 10/26/16.
 */
public class ArraySortingAlgorithms
{
    //InsertionSort
    public void insertionSort(int[] values)
    {
        if (values.length <= 1)
            return;

        int j, value;
        for (int i = 1; i < values.length; i++)
        {
            value = values[i];
            j = i - 1;

            while (j >= 0 && values[j] > value)
            {
                values[j + 1] = values[j];
                j = j - 1;
            }
            values[j + 1] = value;
        }
    }

    //SelectionSort
    public void selectionSort(int[] values)
    {
        if (values.length <= 1)
            return;

        int j, minIndex;
        for (int i = 0; i < values.length - 1; i++)
        {
            minIndex = i;
            for (j = i + 1; j < values.length; j++)
            {
                if (values[j] < values[minIndex])
                {
                    minIndex = j;
                }
            }

            int temp = values[minIndex];
            values[minIndex] = values[i];
            values[i] = temp;
        }
    }

    //MergeSort
    public void mergeSort(int[] values, int left, int right)
    {
        if (left == right)
            return;

        if (left < right) {
            int middle = (left + right) / 2;

            mergeSort(values, left, middle);
            mergeSort(values, middle + 1, right);

            int[] temp = new int[values.length];
            for (int n = left; n <= right; n++) {
                temp[n] = values[n];
            }

            int index1 = left;
            int index2 = middle + 1;
            for (int n = left; n <= right; n++) {
                if (index1 == middle + 1) {
                    values[n] = temp[index2++];
                } else if (index2 > right) {
                    values[n] = temp[index1++];
                } else if (temp[index1] < temp[index2]) {
                    values[n] = temp[index1++];
                } else {
                    values[n] = temp[index2++];
                }
            }
        }
    }

    //QuickSort
    public void quickSort(int[] values, int low, int high)
    {
        if (low < high)
        {
            int index = partition(values, low, high);

            quickSort(values, low, index - 1);
            quickSort(values, index + 1, high);
        }
    }

    int partition(int[] values, int low, int high)
    {
        int pivot = values[high];
        int i = (low - 1);
        for (int j = low; j <= high - 1; j++)
        {
            if (values[j] <= pivot)
            {
                i++;

                int temp = values[i];
                values[i] = values[j];
                values[j] = temp;
            }
        }

        i++;
        int temp = values[i];
        values[i] = values[high];
        values[high] = temp;

        return i;
    }

    //BubbleSort
    public void bubbleSort(int[] values)
    {
        boolean swapped;
        for (int i = 0; i < values.length - 1; i++)
        {
            swapped = false;
            for (int j = values.length -1; j > i; j--)
            {
                if (values[j] < values[j - 1])
                {
                    int temp = values[j];
                    values[j] = values[j - 1];
                    values[j - 1] = temp;
                    swapped = true;
                }
            }

            if (swapped == false)
                break;
        }
    }

    //BucketSort
    public void BucketSort(int[] values, int maxVal)
    {
        int[] bucket = new int[maxVal + 1];
        int num = values.length;
        int bucketNum = bucket.length;

        for (int i = 0; i < bucketNum; i++)
        {
            bucket[i] = 0;
        }

        for (int i = 0; i < num; i++)
        {
            bucket[values[i]]++;
        }

        int pos = 0;
        for (int i = 0; i < bucketNum; i++)
        {
            for (int j = 0; j < bucket[i]; j++)
            {
                values[pos++] = i;
            }
        }
    }

    //CountingSort
    public void CountingSort(int[] values)
    {
        int n = values.length;
        int min = values[0];
        int max = values[0];
        for (int i = 1; i < n; i++)
        {
            if (values[i] < min)
            {
                min = values[i];
            }
            else if (values[i] > max)
            {
                max = values[i];
            }
        }

        int[] count = new int[max - min + 1];
        int z = 0;

        for (int i = 0; i < n; i++)
        {
            count[i] = 0;
        }

        for (int i = 0; i < n; i++)
        {
            count[values[i] - min]++;
        }

        for (int i = min; i <= max; i++)
        {
            while (count[i - min]-- > 0)
            {
                values[z] = i;
                ++z;
            }
        }
    }

    //RadixSort
    public void RadixSort(int[] values)
    {
        int n = values.length;
        int max = values[0];
        for (int i = 1; i < n; i++)
        {
            if (values[i] > max)
            {
                max = values[i];
            }
        }

        for (int exp = 1; max / exp > 0; exp *= 10)
        {
            int[] output = new int[n];
            int[] count = new int[10];

            // Store count of occurrences in count[]
            for (int i = 0; i < n; i++)
            {
                count[(values[i] / exp) % 10]++;
            }

            for (int i = 1; i < 10; i++)
            {
                count[i] += count[i - 1];
            }

            for (int i = n - 1; i >= 0; i--)
            {
                output[count[(values[i] / exp) % 10] - 1] = values[i];
                count[(values[i] / exp) % 10]--;
            }

            for (int i = 0; i < n; i++)
            {
                values[i] = output[i];
            }
        }
    }


}
