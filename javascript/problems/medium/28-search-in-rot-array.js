
// TODO
const search = function (nums, target) {
    let left = 0;
    let right = nums.length - 1;
    while (left <= right) {
        const mid = Math.floor((left + right) / 2)
        if (nums[mid] === target) return mid;

        if (nums[left] < nums[mid] && (target >= nums[left] && target <= nums[mid])) { // left half is sorted and target in left half
            right = mid - 1;
        } else {
            if (nums[mid] < nums[right]) {
                if (target < nums[mid]) {
                    right = mid - 1;
                }
                else if (target > nums[mid]) {
                    right = mid - 1;
                }
            } else {
                left = mid + 1;
            }
        }
    }
    return -1;
};

console.log(search([4,5,6,7,0,1,2], 4))
console.log(search([5,1,3], 3))
console.log(search([5, 1, 2, 3, 4], 1))
console.log(search([5,1,3], 5))